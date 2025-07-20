#!/usr/bin/env bash
set -ex

if ! command -v ghostty &>/dev/null; then
	echo "ghostty not found, installing..."
	snap install ghostty --classic
else
	echo "ghostty already installed, skipping..."
fi

echo "📂 Stowing ghostty configuration files..."
mkdir -p "${HOME}/.config/ghostty"
stow -v -t "${HOME}/.config/ghostty" ghostty
