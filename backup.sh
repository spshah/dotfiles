#!/usr/bin/env bash -fx

# Define the list of files and directories to backup
DOTFILES=("$HOME/.config/Code/User/settings.json" "$HOME/.config/Code/User/keybindings.json" "$HOME/.vimrc" "$HOME/.svndiff.sh" "$HOME/.config/nvim" "$HOME/.aliases" "$HOME/.tmux.conf" "$HOME/setup/dotfiles", "$HOME/.vim")

# Define the backup directory
BACKUP_DIR="$HOME/.dotfiles"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy the dotfiles to the backup directory
for FILE in "${DOTFILES[@]}"; do
    if [ -e "$FILE" ]; then
        cp -r "$FILE" "$BACKUP_DIR"
    else
        if [ -d "$FILE" ]; then
            cp -r "$FILE" "$BACKUP_DIR"
        else
            echo "Warning: $FILE does not exist."
        fi
    fi
done
ls -la "$BACKUP_DIR"
# Initialize a new git repository if it doesn't exist
if [ ! -d "$BACKUP_DIR/.git" ]; then
    cd "$BACKUP_DIR"
    git init
    git remote add origin https://github.com/spshah/private.git
fi

# Commit and push the changes
cd "$BACKUP_DIR"
git add .
git commit -m "Backup of dotfiles on $(date +'%Y-%m-%d')"
git push -u origin master

echo "Backup completed and pushed to GitHub."



