.PHONY: ghostty stow tmux zsh

ghostty: stow
	@chmod +x ghostty/install.sh
	@./ghostty/install.sh

stow:
	sudo apt-get install -y stow
	stow stow

tmux: stow
	@chmod +x tmux/install.sh
	@./tmux/install.sh

zsh: stow
	@chmod +x zsh/install.sh
	@./zsh/install.sh
