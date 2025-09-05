# Dotfiles Setup

This repository contains my personal dotfiles and automation scripts for quickly setting up a development environment on Linux.

## Goal

The goal of this project is to:

- Automate the installation and configuration of essential development tools and software.
- Ensure a consistent, reproducible setup across machines.
- Make it easy to update or migrate my setup with minimal manual intervention.

## Structure

- Each tool has its own directory and `install.sh` script for installation and configuration.
- The `Makefile` orchestrates the installation process, including system dependencies and software via apt and snap.
- Symlinks are managed using `stow` for clean configuration management.

## Main Features

- **System setup:**
  - `make os_setup` updates, upgrades, and installs essential system dependencies.
- **Automated tool installation:**
  - `make install-tools` runs all tool install scripts.
  - Each script installs the tool, configures it, and symlinks config files.
- **Software installation:**
  - `make install-sw` installs additional software (e.g., vivaldi, slack, spotify, docker, kubectl, etc.) using snap and apt.
  - Validates root privileges before running system-level installs.
- **Consistent feedback:**
  - All scripts and Makefile targets use icons and clear echo statements for user-friendly output.

## Usage

1. Clone this repository:
   ```sh
   git clone git@github.com:lcostantini/dotfiles.git
   cd dotfiles
   ```
2. Setup OS + install SW + others:
   ```sh
   sudo make install-sw
   ```
3. Install all tools:
   ```sh
   make install-tools
   ```

## Customization

- Add or modify tool install scripts in their respective directories.
- Update the `Makefile` to include new tools or software as needed.

## Notes

- Some software requires snap or apt repositories to be available.
- For system-level installs, use `sudo` to avoid repeated password prompts.
- The setup is designed for Linux systems; adapt as needed for other platforms.
