#!/usr/bin/env bash -fx

set -e
set -u
set -o pipefail

is_app_installed() {
  type "$1" &>/dev/null
}

# Function to create a symbolic link
create_link() {
    local SOURCE_FILE=$1
    local TARGET_FILE=$2

    # Create target directory if it doesn't exist
    TARGET_DIR=$(dirname "$TARGET_FILE")
    mkdir -p "$TARGET_DIR"

    # Remove existing file or link if it exists
    if [ -e "$TARGET_FILE" ] || [ -L "$TARGET_FILE" ]; then
        mv "$TARGET_FILE" "${TARGET_FILE}.bkp"
        #echo "moved $TARGET_FILE ${TARGET_FILE}.bkp"
    fi

    # Create the symbolic link
    ln -s "$SOURCE_FILE" "$TARGET_FILE"
    echo "Linked $SOURCE_FILE to $TARGET_FILE"
}
BACKUP_DIR="$HOME/.dotfiles1"

if [ ! -d "$BACKUP_DIR" ]; then
    git clone https://github.com/spshah/private.git "$BACKUP_DIR"
else
    cd  "$BACKUP_DIR"

    git pull
fi


# Source the new .bashrc
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
ERR=0
if ! is_app_installed tmux; then
  printf "WARNING: \"tmux\" command is not found. \
Install it first\n"
  ERR=1
fi

if ! is_app_installed nvim; then
  printf "WARNING: \"nvim\" command is not found. \
Install neovim first\n"
  ERR=1
fi


if ! is_app_installed code; then
  printf "WARNING: \"code\" command is not found. \
Install vscode first\n"
  ERR=1
fi

if [ $ERR -eq 1 ]; then
    echo "Ignore Installation. Proceed? [y/n]: "
    read -n 1 ans
    echo
    if [ [ "$ans" == "n" ] ]; then
        exit 1
    fi
fi

# Check if VSCode is installed
if command -v code &> /dev/null; then
    echo "VSCode is installed. Linking JSON configuration files."
    create_link "$BACKUP_DIR/settings.json" "$HOME/.config/Code/User/settings.json"
    create_link "$BACKUP_DIR/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
else
    echo "VSCode is not installed. Skipping JSON configuration files."
fi

# Always create links for other specified dotfiles
echo "Linking remaining dotfiles."
DOTFILES=(".vimrc" ".svndiff.sh" ".aliases" ".tmux.conf" ".vim" ".bashrc" ".cshrc.Linux" )
for DOTFILE in ${DOTFILES[@]}; do
     #Create the symbolic link
     create_link "$BACKUP_DIR/$DOTFILE" "$HOME/$DOTFILE"
done
    create_link "$BACKUP_DIR/nvim" "$HOME/.config/nvim"

FONTS=("FiraMono" "NerdFontsSymbolsOnly" "JetBrainsMono")
mkdir -p "$HOME/.local/share/fonts"
for font in "${FONTS[@]}"; do
    if [ -e "$BACKUP_DIR/dotfiles/$font" ]; then
        find "$BACKUP_DIR/dotfiles/$font" -type f -name "*.ttf" -exec cp "{}" $HOME/.local/share/fonts \;
        find "$BACKUP_DIR/dotfiles/$font" -type f -name "*.otf" -exec cp "{}" $HOME/.local/share/fonts \;
    else 
        echo "ERROR: Unable to load $font."
    fi
done
fc-cache -f -v
echo "All configuration files have been linked successfully."
