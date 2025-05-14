function configs() {
    line_break=$'\n'

    config=$(ls ~/.config/)
    config=$config$line_break$'.zshrc'$line_break'.tmux.conf'
    result=$(echo "$config" | fzf)

    if [ -z "$result" ]; then
        return 0
    fi

    if [ "$result" = '.zshrc' ]; then
        cd $HOME
        nvim "$HOME/.zshrc"
    elif [ "$result" = '.tmux.conf' ]; then
        cd $HOME
        nvim "$HOME/.tmux.conf"
    else
        result="$HOME/.config/$result"
        if [ -d "$result" ];
        then
            cd $result
        else
            cd $HOME
        fi
        nvim $result
    fi
}
alias cf=configs

# fzf npm scripts bindings
_npm_scripts() {
  local declare npm_scripts=$(npm run | grep -v '^\w' | grep -v '^$' | sed 's/^[ ]*//' | paste -d! - -)

  echo "$npm_scripts" | cut -d! -f1 | fzf \
    --preview-window wrap \
    --preview "echo \"${npm_scripts}\" | grep {1}! | cut -d! -f2"
}
_run_npm_scripts() {
  local result=$(_npm_scripts);
  zle reset-prompt;
  LBUFFER+=$result;
}

zle -N _run_npm_scripts
bindkey '^dn' _run_npm_scripts

# fzf makefile phony bindings
_makefile_phony() {
  echo "$(grep .PHONY Makefile | cut -d ' ' -f2)" | fzf \
    --preview-window wrap \
    --preview "cat Makefile | sed -n '/^\.PHONY: {1}$/,/^$/p'"
}
_run_makefile_phony() {
  local result=$(_makefile_phony);
  zle reset-prompt;
  LBUFFER+=$result;
}

zle -N _run_makefile_phony
bindkey '^dm' _run_makefile_phony
