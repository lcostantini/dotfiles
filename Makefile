.PHONY: asdf github ghostty nvim tmux zsh

TOOLS := asdf github ghostty nvim tmux zsh
SNAP_SOFTWARE := vivaldi slack spotify docker k9s
SNAP_CONFINMENT_SOFTWARE := kubectl helm terraform google-cloud-cli
REPOSITORY_SOFTWARE := docker-compose-plugin

install-tools: $(TOOLS)
	@echo "\n🎉 All tools installed successfully!"

install-sw: os_setup
	@if [ "$$(id -u)" -ne 0 ]; then \
		echo "❌ Run this action with sudo to avoid being ask the password for each snap"; \
		echo "sudo make install-sw"; \
		exit 1; \
	fi
	@echo "\n📦 Installing software: $(SOFTWARE)"
	for pkg in $(SNAP_SOFTWARE); do \
		snap install $$pkg || true; \
	done
	for pkg in $(SNAP_CONFINMENT_SOFTWARE); do \
		snap install $$pkg --classic || true; \
	done
	sudo apt-get install -y $(REPOSITORY_SOFTWARE)

os_setup:
	@echo "🔄 Updating package lists..."
	sudo apt-get update
	@echo "\n⬆  Upgrading installed packages..."
	sudo apt-get upgrade -y
	@echo "\n⬆  Upgrading all snap packages..."
	snap refresh
	@echo "\n📦 Installing essentials dependencies..."
	sudo apt-get install -y \
		stow \
		xclip \
		ripgrep \
		fd-find
	# Create symlink for fd-find to fd
	ln -s $(which fdfind) ~/.local/bin/fd
	@echo "\n🎉 OS setup completed successfully!"

$(TOOLS):
	@echo "\n🔧 Ensuring $@/install.sh is executable..."
	@chmod +x $@/install.sh
	@echo "🚀 Running $@/install.sh..."
	@./$@/install.sh
