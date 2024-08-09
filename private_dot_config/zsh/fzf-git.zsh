# Some parts taken from https://github.com/junegunn/fzf-git.sh

_fzf_git_check() {
  git rev-parse HEAD > /dev/null 2>&1 && return

  [[ -n $TMUX ]] && tmux display-message "Not in a git repository"
  return 1
}

__fzf_git_join() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

_fzf_git_branches() {
  _fzf_git_check || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf --height 50% "$@" --border -down --ansi --multi --tac |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}
_run_fzf_git_branches() {
  local result=$(_fzf_git_branches | __fzf_git_join);
  zle reset-prompt;
  LBUFFER+=$result;
}

zle -N _run_fzf_git_branches
bindkey '^gb' _run_fzf_git_branches

_fzf_git_files() {
  _fzf_git_check || return
  git -c color.status=always status --short |
  fzf -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}
_run_fzf_git_files() {
  local result=$(_fzf_git_files | __fzf_git_join);
  zle reset-prompt;
  LBUFFER+=$result;
}

zle -N _run_fzf_git_files
bindkey '^gf' _run_fzf_git_files
