autoload -U edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
