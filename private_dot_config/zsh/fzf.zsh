function configs() {
    line_break=$'\n'

    config=$(ls ~/.config/)
    config=$config$line_break$'.zshrc'
    config=$(echo "$config" | fzf)

    if [ "$config" = '.zshrc' ]; then
        nvim "$HOME/.zshrc"
    else
        config="$HOME/.config/$config"
        nvim $config
    fi
}
alias cf=configs

fzf_open() {
    target=$(ls -d * | fzf)
    if [ -z "$target" ];
    then
        echo "selection is empty"
    else
        if [ -d "$target" ];
        then
            cd $target
        else
            nvim $target
        fi
    fi
}

fzf_open_zle() {
    BUFFER="fzf_open";
    zle accept-line;
}
zle -N fzf_open_zle
bindkey "\ej" fzf_open_zle

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
