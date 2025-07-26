.PHONY: asdf ghostty nvim stow tmux zsh

TOOLS := asdf ghostty nvim tmux zsh

install: $(TOOLS)
	@echo "🎉 All tools installed successfully!"

os_setup:
	sudo apt-get update
	sudo apt-get upgrade -y
	stow $(TOOLS)

stow:
	sudo apt-get install -y stow
	stow stow

$(TOOLS):
	@echo "🔧 Ensuring $@/install.sh is executable..."
	@chmod +x $@/install.sh
	@echo "🚀 Running $@/install.sh..."
	@./$@/install.sh
