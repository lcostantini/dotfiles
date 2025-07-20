# <---------------------- Plugins ------------------------>
plugins=(
  git
)

# <--------------------- oh-my-zsh ----------------------->
# init zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple-custom"

DISABLE_AUTO_TITLE=true

source $ZSH/oh-my-zsh.sh

# <--------------------- Config ----------------------->
# Custom project directory to be used by "c" function
export PROJECTS="$HOME/projects/ikea"

# Custom completions
export FPATH=$FPATH:$ZSH/custom/completions

# Set default EDITOR to NeoVim
export EDITOR='~/.config/nvim/nvim.appimage'
# Use latest NVIM from package source (github.com/nvim)
alias nv=~/.config/nvim/nvim.appimage

# Page output via less. Eg: when using git log is printed on the same outpt
# -X: do not clear the screen on exit
# -F: quit automatically if the content fits on one screen
# -R: allow raw colors (like git coloring)
export LESS="-XFR"

# Export Go private to fetch repositories
export GOPRIVATE=github.com/ingka-group-digital

# Add local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"
