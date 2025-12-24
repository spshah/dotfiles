#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"
USER_NAME="$USER"

# -----------------------------
# Helpers
# -----------------------------
backup_if_exists() {
    local TARGET="$1"
    if [ -e "$TARGET" ]; then
        local TS
        TS=$(date +%Y%m%d_%H%M%S)
        mv "$TARGET" "${TARGET}.bkp.${TS}"
        echo "🧷 Backup: ${TARGET}.bkp.${TS}"
    fi
}

copy_user_config() {
    local SRC="$1"
    local BASE="$2"

    local USER_FILE="$HOME/${BASE}.${USER_NAME}"
    backup_if_exists "$USER_FILE"
    cp -r "$SRC" "$USER_FILE"
    echo "📄 Installed $USER_FILE"
}

ensure_source_line() {
    local WRAPPER="$1"
    local USER_FILE="$2"

    touch "$WRAPPER"
    grep -q "$USER_FILE" "$WRAPPER" || \
        echo "source $USER_FILE" >> "$WRAPPER"
}

# -----------------------------
# Vim
# -----------------------------
copy_user_config "$DOTFILES/vim/vimrc.spshah" ".vimrc"
ensure_source_line "$HOME/.vimrc" "$HOME/.vimrc.${USER_NAME}"

# -----------------------------
# tmux
# -----------------------------
copy_user_config "$DOTFILES/tmux/tmux.conf" ".tmux.conf"
ensure_source_line "$HOME/.tmux.conf" "$HOME/.tmux.conf.${USER_NAME}"

# -----------------------------
# csh
# -----------------------------
copy_user_config "$DOTFILES/csh/cshrc" ".cshrc"
ensure_source_line "$HOME/.cshrc" "$HOME/.cshrc.${USER_NAME}"

# -----------------------------
# Neovim (directory-based)
# -----------------------------
NVIM_USER_DIR="$HOME/.config/nvim.${USER_NAME}"
backup_if_exists "$NVIM_USER_DIR"
cp -r "$DOTFILES/nvim" "$NVIM_USER_DIR"

mkdir -p "$HOME/.config"
backup_if_exists "$HOME/.config/nvim"
ln -s "$NVIM_USER_DIR" "$HOME/.config/nvim"

# -----------------------------
# Bash helpers
# -----------------------------
copy_user_config "$DOTFILES/scripts/bash/aliases" ".aliases"

# -----------------------------
# Fonts (machine-wide, safe copy)
# -----------------------------
FONT_DST="$HOME/.local/share/fonts"
mkdir -p "$FONT_DST"

find "$DOTFILES/data" -type f \( -name "*.ttf" -o -name "*.otf" \) \
    -exec cp "{}" "$FONT_DST" \;

fc-cache -f -v

echo "✅ Dotfiles installed for user: $USER_NAME"

