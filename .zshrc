# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussellhacked"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vim zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/ben/sites/tt/node_modules/nodeunit/bin:/home/ben/bin/:/home/ben/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

case "$TERM" in
    rxvt-256color)
        TERM=rxvt-unicode
        ;;
esac
# List any open tmux sessions
if [ `whoami` != 'root' ]; then
    tmux list-sessions
fi

# Use vi output mode
set -o vi

alias v='vim'
alias vd='vimdiff'

alias c="clear"

# git stuff
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gch="git checkout"
alias gd="git diff"
alias gb="git branch"
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# tmux stuff
alias tmux="tmux -2"
alias tl="tmux list-sessions"
alias tn="tmux new-session -s"
alias tx="tmux attach-session -t"
alias tw="tmux_attach"
alias ts="tmux attach-session -t `tmux list-sessions -F '#{session_name}' | head -n 1` \; choose-session"

alias ack="ack-grep"
alias lsprocess="cd ~/devel/ls/process"
alias boris="~/tools/boris/bin/boris";
alias o="xdg-open"
alias s="source ~/.zshrc"

# VPN
alias vpn="cd /etc/openvpn/ && sudo openvpn './UK London.ovpn'"

function tmux_attach() { 
    echo tmux new-session -s "$@"-w "$@" 
    tmux new-session -s "$@"-w -t "$@" 
}

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

if [ -f /usr/local/rvm/scripts/rvm ]; then
    source /usr/local/rvm/scripts/rvm
fi

bindkey "^R" history-incremental-search-backward

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

set horizontal-scroll-mode on

alias emacs="emacs-snapshot -nw"

# docker
alias docker="sudo docker.io"
alias d="sudo docker.io"
alias di="sudo docker.io images"
alias dp="sudo docker.io ps"
# Attach latest
alias da='lxc-attach -n $(docker ps -notrunc | sed 1d | cut -d " " -f1)'
# Kill latest

