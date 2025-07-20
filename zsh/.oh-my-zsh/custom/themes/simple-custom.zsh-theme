# ===============================
# Simple custom Zsh theme
# Shows:
# - Go version (via asdf)
# - Current dir
# - Git branch + dirty state
# - Push status
# ===============================

# -------------------------------
# Language version info functions
# -------------------------------
function go_prompt_info() {
  local version=$(asdf current golang | awk 'NR > 1 {print $2}')
  echo "golang[$version]"
}

# -------------------------------
# Git status functions
# -------------------------------
function git_branch_dirty() {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

function git_prompt_info() {
  if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    echo ""
    return
  fi

  if [[ -z $(git status --porcelain 2> /dev/null) ]]; then
    # Repo is clean
    echo " %{$fg[green]%}$(git_branch_dirty)%{$reset_color%}"
  else
    # Repo has changes
    echo " %{$fg[red]%}$(git_branch_dirty)%{$reset_color%}"
  fi
}

function need_push() {
  # Check if there are unpushed commits
  if git rev-parse --abbrev-ref @{u} &>/dev/null; then
    if [[ -z $(git cherry -v @{upstream} 2>/dev/null) ]]; then
      echo ""
    else
      echo " %{$fg_bold[magenta]%}unpushed%{$reset_color%}"
    fi
  fi
}

# -------------------------------
# Prompt configuration
# -------------------------------

# Main prompt
PROMPT='%{$fg_bold[yellow]%}$(go_prompt_info) %{$fg_bold[cyan]%}%c$(git_prompt_info)$(need_push) %{$reset_color%}'

# Optional: Right side prompt (if you want)
# RPROMPT='%{$fg[white]%}$(need_push)'
