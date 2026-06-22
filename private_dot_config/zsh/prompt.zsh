export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# %f - сброс foreground, %F{color} - цвет foreground
# %k - сброс background, %K{color} - цвет background
PROMPT='$(prompt_prefix)%F{cyan}%k%~%f%k $(check_git_repo)'$'\n''$ '
RPROMPT=''

prompt_prefix() {
  local parts=()

  if [[ -n "$SSH_CONNECTION" ]]; then
    parts+=('%F{red}%K{red}%F{white} %n@%m %k%F{red}%f')
  fi

  if [[ -n "$LF_LEVEL" ]]; then
    parts+=('%F{red}%K{red}%F{white} LF %k%F{red}%f')
  fi

  if [[ -n "$CHEZMOI" ]]; then
    parts+=('%F{red}%K{red}%F{white} chezmoi %k%F{red}%f')
  fi

  # если parts пустой — ничего не выводим
  (( ${#parts[@]} )) || return

  echo -n "${(j: :)parts} "
}

function check_git_repo() {
  if [ -z $(git rev-parse --git-dir 2> /dev/null) ]; then
    echo "%f%k"
  else
    echo "%F{red}%k%F{white}%K{red}$(__git_ps1 '%s')%F{red}%k%f%k"
  fi
}
