.PHONY: tmux stow ghostty

ghostty: stow
	@chmod +x ghostty/install.sh
	@./ghostty/install.sh

stow:
	sudo apt-get install -y stow
	stow stow

tmux: stow
	@chmod +x tmux/install.sh
	@./tmux/install.sh
