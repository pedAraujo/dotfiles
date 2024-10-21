#!/bin/bash

# Function to display formatted messages
info() {
    echo -e "\033[1;32m[INFO]\033[0m $1"
}

error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# Variables
DOTFILES_DIR="$HOME/Dev/pedAraujo/dotfiles"  # Path to the dotfiles directory
BACKUP_DIR="$HOME/dotfiles_backup"   # Backup directory for old configuration files

# Function to create symlink and backup old files
create_symlink() {
    local source_file=$1
    local target_file=$2

    if [ -e "$target_file" ]; then
        info "Backing up $target_file to $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        mv "$target_file" "$BACKUP_DIR"
    fi

    ln -s "$source_file" "$target_file"
    info "Symlink created: $source_file -> $target_file"
}

# Update system (optional)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update && sudo apt upgrade -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew update && brew upgrade
else
    error "Unsupported operating system!"
    exit 1
fi

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    error "Dotfiles directory not found!"
    exit 1
fi

# Clone dotfiles repository if not already present
if [ ! -d "$DOTFILES_DIR/.git" ]; then
    info "Cloning dotfiles repository"
    mkdir -p "$DOTFILES_DIR"
    git clone https://github.com/pedAraujo/dotfiles.git "$DOTFILES_DIR"
else
    info "Dotfiles repository already present"
fi

# Create symlinks
info "Creating symlinks..."

create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
create_symlink "$DOTFILES_DIR/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# Check if zsh is installed
if command -v zsh >/dev/null 2>&1; then
    info "zsh detected, creating symlink for .zshrc"

    # Change default shell to zsh
    info "Changing default shell to zsh"
    chsh -s $(which zsh)

else
    info "zsh not detected, configuring .bashrc"

    # Check if there's a .bashrc equivalent in dotfiles
    if [ -f "$DOTFILES_DIR/.bashrc" ]; then
        create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    else
        info "No .bashrc file found in dotfiles directory. Creating a basic equivalent."
        cp "$DOTFILES_DIR/.zshrc" "$DOTFILES_DIR/.bashrc"
        sed -i 's/\.zsh/\.bash/g' "$DOTFILES_DIR/.bashrc"  # Adjust any zsh-specific commands
        create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    fi

    # Change default shell to bash
    info "Changing default shell to bash"
    chsh -s $(which bash)
fi

# Install necessary packages (optional)
info "Installing required packages..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install -y zsh tmux neovim
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh tmux neovim
fi

info "Setup complete! Restart your terminal to apply changes."

