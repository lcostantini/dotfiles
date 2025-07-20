# alias be='bundle exec'
alias doco='docker compose'

alias si='sudo apt-get install'
alias sr='sudo apt-get remove --purge'
alias sup='sudo apt-get update'
alias sug='sudo apt-get upgrade'
alias uu='sudo apt-get update && sudo apt-get upgrade'
alias aa='sudo apt-get autoclean && sudo apt-get autoremove'

# You need to install CTAGS first
# Ubuntu: sudo apt-get install exuberant-ctags
# OSX: brew install ctags
# alias ctags="`brew --prefix`/bin/ctags"
# alias ctags_ruby="ctags -R --languages=ruby --exclude=.git --exclude=log ."
# alias ctags_elixir="ctags -R --languages=elixir --exclude=.git --exclude=log --exclude=deps/ --exclude=_build/ --exclude=priv/ ."

# persist history in iex
# alias iex='iex --erl "-kernel shell_history enabled"'
# alias epry='iex --erl "-kernel shell_history enabled" -S mix test --trace $1'

# GIT aliases
alias gsf='git show --pretty="" --name-only '

alias gtd='git tag vDev-$(git rev-parse --short HEAD) && git push --tags'
alias gtt='git tag vTest-$(git rev-parse --short HEAD) && git push --tags'
alias gts='git tag vStage-$(git rev-parse --short HEAD) && git push --tags'
alias gtp='git tag vProd-$(git rev-parse --short HEAD) && git push --tags'

# Git autosquash for HEAD~N
gas() { git rebase -i --autosquash HEAD~"$1"; }

# Need to install xclip to copy to clipboard in Linux
# Copy commit SHA from selected HEAD number
gsha() { git rev-parse --short HEAD~"$1" | xclip -selection clipboard; }

# Add automatic fixup commit for value of HEAD~N
gaf() { git add .; gitSha=$(git rev-parse HEAD~"$1"); git commit --fixup $gitSha }

# Function to rename the current tmux window to the basename of the current directory
tmuxrw() {
  # Get basename of current directory
  local dir_name="${PWD##*/}"
  # Rename tmux window
  tmux rename-window "$dir_name"
}
