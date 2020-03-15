#
# ~/.bashrc
#

bind :clear-screen

alias up="yay -Syu --noconfirm"
alias ls='exa --color=always --group-directories-first -lh'
alias oneup_ssh="ssh root@134.209.55.229"
alias g="git"
alias grep="rg"
alias cat="bat --theme=ansi-dark --style=changes"
alias bc="bc -l"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/i386elfgcc"
if [ $HOSTNAME="skynet.mobile" ]; then
    export PATH="$PATH:$HOME/Programming/go/bin"
    export GOPATH="$HOME/Programming/go"
else 
    export PATH="$PATH:mnt/Media/Programming/go/bin"
    export GOPATH="mnt/Media/Programming/go"
fi

export PATH="$PATH:/opt/texlive/2019/bin/x86_64-linux"
export MANPATH="$MANPATH:/opt/texlive/2019/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/opt/texlive/2019/texmf-dist/doc/info"

[[ $- != *i* ]] && return

export LANG=en_US.utf8

source ~/git-completion.bash

PS1='\e[0;34m \u\e]\e[m in\e]\e[0;35m \W\e]\e[0;31m@\e]\e[0;32m\h\e]\e[33m λ\e]\e[39m\] '
