export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

#  - e0b6  - e0d6  - e0ba
#  - e0bc  - e0a0
# %f - сброс foreground, %F{color} - цвет foreground
# %K - сброс background, %K{color} - цвет background
PROMPT='$(prompt_prefix)%F{yellow}%F{white}%K{yellow}%n%K{cyan}%F{yellow}%K{cyan}%F{white}%c%f%k$(check_git_repo)'$'\n''$ '
RPROMPT=''

prompt_prefix() {
  local parts=()

  local print_hostname='yes'
  if [[ -n "$SSH_CONNECTION" ]]; then
    parts+=('%F{red}%K{red}%F{white} %m %k%F{red}%f')
  fi

  if [[ -n "$LF_LEVEL" ]]; then
    parts+=('%F{red}%K{red}%F{white} [LF] %k%F{red}%f')
  fi

  if [[ -n "$CHEZMOI" ]]; then
    parts+=('%F{red}%K{red}%F{white} [chezmoi] %k%F{red}%f')
  fi

  # если parts пустой — ничего не выводим
  (( ${#parts[@]} )) || return

  echo -n "${(j: :)parts} "
}

function check_git_repo() {
  if [ -z $(git rev-parse --git-dir 2> /dev/null) ]; then
    echo "%f%k%F{cyan}%f%k"
  else
    echo "%F{cyan}%K{red}%F{white}%K{red} $(__git_ps1 ' %s ')%f%k%F{red}%f%k"
  fi
}
