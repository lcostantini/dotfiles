#!/usr/bin/env bash
set -e

# Install zsh
# https://www.zsh.org/
if ! command -v zsh &>/dev/null; then
  sudo apt-get install -y zsh

  echo "🔄 Changing default shell to zsh..."
  chsh -s "$(which zsh)"
else
  echo "✅ Zsh already installed, skipping..."
fi

# Install oh-my-zsh if not already
# https://ohmyz.sh/#install
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo "🎨 Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✅ oh-my-zsh already installed, skipping..."
fi

# create symlinks with stow
# --adopt option allows stow to adopt existing files.
# That is used because zsh creates a default config after install
echo "📂 Stowing nvim configuration files..."
stow --adopt -v -t "${HOME}" zsh
