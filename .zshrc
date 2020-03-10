# Path to your oh-my-zsh installation.
export ZSH=/home/liush/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git bundler rake ruby rvm)

# User configuration

export PATH="/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/bin:/home/liush/.rvm/bin"
export PATH="/home/liush/anaconda3/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

export EDITOR=nvim
export http_proxy=http://192.168.158.177:1080
export https_proxy=http://192.168.158.177:1080
alias hp="export http_proxy=http://192.168.158.177:1080 & export https_proxy=http://192.168.158.177:1080"
alias nhp="export http_proxy='' & https_proxy=''"

source "$ZSH/oh-my-zsh.sh"
export PATH="$PATH:$HOME/codes/my_config/dasht/bin"
export PATH="$HOME/miniconda3/bin:$PATH"

export nuc="liush@172.27.0.2"
alias vim="nvim"
alias vi="nvim"
alias tmux="tmux -2"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
