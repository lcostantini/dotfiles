.PHONY: asdf ghostty stow tmux zsh

TOOLS := asdf ghostty tmux zsh

install:
	sudo apt-get update
	sudo apt-get upgrade -y
	stow $(TOOLS)

stow:
	sudo apt-get install -y stow
	stow stow

$(TOOLS):
	@echo "Ensuring $@/install.sh is executable..."
	@chmod +x $@/install.sh
	@echo "Running $@/install.sh..."
	@./$@/install.sh
