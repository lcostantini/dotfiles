#!/usr/bin/env bash
set -e

if ! command -v nvim -v &>/dev/null; then
  echo "📝 nvim not found, installing..."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
  rm nvim-linux-x86_64.tar.gz
else
  echo "✅ nvim already installed, skipping..."
fi

echo "📂 Stowing nvim configuration files..."
stow -v -t "${HOME}" nvim
