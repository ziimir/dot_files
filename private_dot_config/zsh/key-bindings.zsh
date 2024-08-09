autoload -z edit-command-line
zle -N edit-command-line
bindkey "\ei" edit-command-line

ls_la() { BUFFER="ls -la"; zle accept-line; }
zle -N ls_la
bindkey "\el" ls_la
