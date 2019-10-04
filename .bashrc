#
# ~/.bashrc
#

bind :clear-screen

alias update="yay -Syu --noconfirm"
alias ls='exa --color=always --group-directories-first -lh'
alias haski='cabal install --disable-library-vanilla --enable-shared --enable-executable-dynamic'
alias oneup_ssh="ssh root@134.209.55.229"
alias g="git"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Programming/go/bin"
export PATH="$PATH:/usr/local/i386elfgcc"
export GOPATH="$HOME/Programming/go"

[[ $- != *i* ]] && return

PS1='\e[0;34m \u\e]\e[m in\e]\e[0;35m \W\e]\e[0;31m@\e]\e[0;32m\h\e]\e[33m λ\e]\e[39m\] '
