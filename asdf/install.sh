#!/usr/bin/env bash
set -e

if [ -d "$HOME/.asdf" ]; then
  echo "✅ asdf already installed at $HOME/.asdf"
else
  # Clone asdf repository
  wget https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz
  tar -xzvf asdf-v0.18.0-linux-amd64.tar.gz -C $HOME/.local/bin
  rm asdf-v0.18.0-linux-amd64.tar.gz
  echo "📦 asdf cloned to $HOME/.asdf"
fi

echo "🎉 asdf installed and configured"

# Install plugins (optional)
echo "🔌 Installing plugins..."
$HOME/.local/bin/asdf plugin add golang
echo "🔌 Plugins installed"

# Install specific versions
echo "⬇️ Installing Golang 1.24.1..."
$HOME/.local/bin/asdf install golang 1.24.1
$HOME/.local/bin/asdf global golang 1.24.1

echo "🎉 asdf programming languages installed"
