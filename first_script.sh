#!/bin/sh
set -e
echo "Installing ZSH and Oh My Zsh"
sudo apt-get install zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"