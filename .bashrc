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

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Programming/go/bin"
export PATH="$PATH:/usr/local/i386elfgcc"
export GOPATH="/mnt/Media/Programming/go"

[[ $- != *i* ]] && return

PS1='\e[0;34m \u\e]\e[m in\e]\e[0;35m \W\e]\e[0;31m@\e]\e[0;32m\h\e]\e[33m λ\e]\e[39m\] '
