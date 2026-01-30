#!/usr/bin/env bash
set -euo pipefail

BASE_MODEL="qwen2.5-coder:7b"
CUSTOM_MODEL="qwen2.5-coder-django-react"

echo "== Ollama (CPU-only) setup for Django + React on Arch =="

# --------------------------------------------------
# 1. Verify Arch Linux
# --------------------------------------------------
if ! command -v pacman >/dev/null 2>&1; then
  echo "❌ This script is intended for Arch Linux."
  exit 1
fi

# --------------------------------------------------
# 2. Install Ollama if missing
# --------------------------------------------------
if ! command -v ollama >/dev/null 2>&1; then
  echo "📦 Installing Ollama..."
  #udo pacman -S --noconfirm ollama
  curl -fsSL https://ollama.com/install.sh | sh
else
  echo "✅ Ollama already installed"
fi

# --------------------------------------------------
# 3. Enable and start system service
# --------------------------------------------------
echo "🚀 Enabling ollama system service..."
sudo systemctl enable --now ollama

# --------------------------------------------------
# 4. Systemd override: memory safety + CPU-only
# --------------------------------------------------
echo "🛠️  Applying systemd overrides..."

sudo mkdir -p /etc/systemd/system/ollama.service.d

sudo tee /etc/systemd/system/ollama.service.d/override.conf >/dev/null <<'EOF'
[Service]
# Allow only one inference at a time (prevents RAM exhaustion)
Environment="OLLAMA_NUM_PARALLEL=1"
Environment="OLLAMA_MAX_LOADED_MODELS=1"

# Hide AMD GPUs completely from ROCm/HIP
Environment="ROCR_VISIBLE_DEVICES=-1"
Environment="CUDA_VISIBLE_DEVICES=-1"
EOF



echo "🚀 Restarting ollama system service..."
sudo systemctl daemon-reload
sudo systemctl restart ollama

echo "Waiting for Ollama API to become ready"
for i in {1..30}; do
  if curl -sf http://127.0.0.1:11434/api/tags >/dev/null; then
    echo  "Ollama is ready"
    break
  fi
  sleep 1
done

# --------------------------------------------------
# 5. Pull base model
# --------------------------------------------------
echo "📥 Pulling base model: $BASE_MODEL"
ollama pull "$BASE_MODEL"

# --------------------------------------------------
# 6. Create Modelfile (CPU-thread tuned)
# --------------------------------------------------
echo "🧠 Writing Modelfile..."

cat > Modelfile <<'EOF'
FROM qwen2.5-coder:7b

# ---- Sampling behavior ----
PARAMETER temperature 0.2
PARAMETER top_p 0.9
PARAMETER repeat_penalty 1.1

# ---- Context & CPU tuning ----
PARAMETER num_ctx 8192
PARAMETER num_thread 4

SYSTEM """
You are a senior software engineer working in a single monorepo.

Backend:
- Django
- Django REST Framework
- 2–3 domain-focused apps (e.g. budget, expenses)
- Conventional models / serializers / views separation

Frontend:
- React with functional components and hooks
- JSX, no class components unless already present

Rules:
- Follow existing project patterns and naming
- Prefer minimal, localized changes
- Do NOT invent libraries or frameworks
- Do NOT redesign architecture unless explicitly requested

When modifying code:
- Output a unified git-style diff
- Include only changed hunks
- Be precise and conservative

If context is missing:
- State assumptions explicitly
"""
EOF

# --------------------------------------------------
# 7. Build custom model
# --------------------------------------------------
echo "🔧 Creating custom model: $CUSTOM_MODEL"
ollama create "$CUSTOM_MODEL" -f Modelfile

# --------------------------------------------------
# 8. Smoke test
# --------------------------------------------------
echo "🧪 Running smoke test..."

ollama run "$CUSTOM_MODEL" <<'EOF'
Here is a Django model:

class Expense(models.Model):
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)

Add a category foreign key.
Return a unified diff only.
EOF

echo
echo "✅ Setup complete."
echo
echo "Use with:"
echo "  ollama run $CUSTOM_MODEL"

