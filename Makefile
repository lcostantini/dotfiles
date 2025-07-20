.PHONY: tmux stow

stow:
	sudo apt-get install -y stow
	stow stow

tmux: stow
	@chmod +x tmux/install.sh
	@./tmux/install.sh
