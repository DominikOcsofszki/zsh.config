export LANG=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$HOME/.config/zsh



export PAGER="col -b|nvim -R -c 'set ft=man' - "
export VISUAL='nvim' 
export EDITOR='nvim' 


export SDKMAN_DIR="$HOME/.sdkman"
export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
export HISTIGNORE="ls:cd:pwd"
export HISTFILESIZE=20000

source $ZDOTDIR/zsh_nvim/load_inside_nvim.zsh

# uv
export PATH="/Users/dominik/.local/bin:$PATH"
