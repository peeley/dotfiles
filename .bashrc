#
# ~/.bashrc
#

bind :clear-screen

alias update="yay -Syu --noconfirm"
alias ls='ls --color=auto --group-directories-first'
alias haski='cabal install --disable-library-vanilla --enable-shared --enable-executable-dynamic'

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Programming/go/bin"
export PATH="$PATH:/usr/local/i386elfgcc"
export GOPATH="$HOME/Programming/go"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\e[0;34m \u\e]\e[m in\e]\e[0;35m \W\e]\e[0;31m@\e]\e[0;32m\h\e]\e[33m λ\e]\e[39m\] '
