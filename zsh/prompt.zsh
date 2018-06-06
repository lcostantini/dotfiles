autoload colors && colors

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

ruby_version() {
  echo "ruby-$(asdf current ruby | awk '{print $1}')"
}

elixir_version() {
  echo "elixir-$(asdf current elixir | awk '{print $1}')"
}

node_version() {
  echo "node-$(asdf current nodejs | awk '{print $1}')"
}

rb_prompt() {
  echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%}@%{$fg_bold[yellow]%}$(elixir_version)%{$reset_color%}@%{$fg_bold[yellow]%}$(node_version)%{$reset_color%}"
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'\n$(rb_prompt) in $(directory_name) $(git_dirty)$(need_push)\n› '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
