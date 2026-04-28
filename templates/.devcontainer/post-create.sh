#!/bin/bash
# This script is executed after the container is created.

# Set zsh as the default shell for the vscode user
sudo chsh -s "$(which zsh)" vscode

# Append the following lines to ~/.zshrc to customize the shell environment.
# Using a HEREDOC with tee allows for clean, multi-line appends.
tee -a ~/.zshrc > /dev/null << 'EOF'

# Source personal installation script if it exists
if [ -f "$HOME/.dotfiles/install.sh" ]; then
    source "$HOME/.dotfiles/install.sh"
fi
EOF
