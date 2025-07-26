#!/usr/bin/env bash
set -e

if ! command -v tmux -v &>/dev/null; then
	echo "📟 tmux not found, installing..."
	sudo apt-get install -y tmux
else
	echo "✅ tmux already installed, skipping..."
fi

stow -v -t "${HOME}" tmux
