#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="$HOME/dotfiles"
GIT_REMOTE="https://github.com/spshah/dotfiles.git"
USER_NAME="$USER"

echo "🔄 Backing up dotfiles for user: $USER_NAME"
echo "📁 Repo: $DOTFILES_REPO"

# Ensure repo exists
mkdir -p "$DOTFILES_REPO"

# -----------------------------
# VSCode
# -----------------------------
mkdir -p "$DOTFILES_REPO/vscode"
cp -f "$HOME/.config/Code/User/settings.json" \
      "$DOTFILES_REPO/vscode/settings.json" 2>/dev/null || true
cp -f "$HOME/.config/Code/User/keybindings.json" \
      "$DOTFILES_REPO/vscode/keybindings.json" 2>/dev/null || true

# -----------------------------
# Vim / Neovim (user-specific)
# -----------------------------
mkdir -p "$DOTFILES_REPO/vim" "$DOTFILES_REPO/nvim"

if [ -f "$HOME/.vimrc.${USER_NAME}" ]; then
    cp -f "$HOME/.vimrc.${USER_NAME}" \
          "$DOTFILES_REPO/vim/vimrc.${USER_NAME}"
elif [ -f "$HOME/.vimrc" ]; then
    cp -f "$HOME/.vimrc" \
          "$DOTFILES_REPO/vim/vimrc.${USER_NAME}"
fi

if [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$DOTFILES_REPO/nvim"
    cp -r "$HOME/.config/nvim" "$DOTFILES_REPO/nvim"
fi

# -----------------------------
# tmux
# -----------------------------
mkdir -p "$DOTFILES_REPO/tmux"
if [ -f "$HOME/.tmux.conf.${USER_NAME}" ]; then
    cp -f "$HOME/.tmux.conf.${USER_NAME}" \
          "$DOTFILES_REPO/tmux/tmux.conf.${USER_NAME}"
elif [ -f "$HOME/.tmux.conf" ]; then
    cp -f "$HOME/.tmux.conf" \
          "$DOTFILES_REPO/tmux/tmux.conf.${USER_NAME}"
fi

# -----------------------------
# csh
# -----------------------------
mkdir -p "$DOTFILES_REPO/csh"
if [ -f "$HOME/.cshrc.${USER_NAME}" ]; then
    cp -f "$HOME/.cshrc.${USER_NAME}" \
          "$DOTFILES_REPO/csh/cshrc.${USER_NAME}"
elif [ -f "$HOME/.cshrc" ]; then
    cp -f "$HOME/.cshrc" \
          "$DOTFILES_REPO/csh/cshrc.${USER_NAME}"
fi

# -----------------------------
# Bash utilities
# -----------------------------
mkdir -p "$DOTFILES_REPO/scripts/bash"
[ -f "$HOME/.aliases" ] && \
    cp -f "$HOME/.aliases" "$DOTFILES_REPO/scripts/bash/aliases"
[ -f "$HOME/.svndiff.sh" ] && \
    cp -f "$HOME/.svndiff.sh" "$DOTFILES_REPO/scripts/bash/svndiff.sh"

# -----------------------------
# Git operations
# -----------------------------
cd "$DOTFILES_REPO"

if [ ! -d ".git" ]; then
    git init
    git remote add origin "$GIT_REMOTE"
fi

git add .

if git diff --cached --quiet; then
    echo "ℹ️ No changes to commit"
else
    git commit -m "Backup dotfiles for ${USER_NAME} ($(date +'%Y-%m-%d %H:%M'))"
    git push -u origin master
    echo "✅ Changes committed and pushed"
fi
