alias reload!='. ~/.zshrc'

# My personal alias
alias si='sudo apt-get install'
alias sr='sudo apt-get remove --purge'
alias sag='sudo apt-get'
alias uu='sudo apt-get update && sudo apt-get upgrade'
alias up='sudo apt-get update'
alias aa='sudo apt-get autoclean && sudo apt-get autoremove'

# Alias for work
alias be='bundle exec'
alias esc='xmodmap ~/.dotfiles/script/.xmodmap'
alias redis='~/.dotfiles/script/run-redis.sh'
alias doco='docker-compose'

# You need to install CTAGS first
# Ubuntu: sudo apt-get install exuberant-ctags
# OSX: brew install ctags
alias ctags="`brew --prefix`/bin/ctags"
alias g_ruby_tags="ctags -R --languages=ruby --exclude=.git --exclude=log ."
# alias g_bundle_tags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"

# persist history in iex
alias iex='iex --erl "-kernel shell_history enabled"'
alias epry='iex --erl "-kernel shell_history enabled" -S mix test --trace $1'
