#
# ~/.bashrc
#
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.local/bin:/usr/bin/core_perl
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias update="yay -Syu --noconfirm"
alias program="cd /mnt/Media/Programming/"
alias tux="tmux new"
alias f="flask run --host=0.0.0.0 --port=80"
alias ls='ls --color=auto --group-directories-first'
alias haski='cabal install --disable-library-vanilla --enable-shared --enable-executable-dynamic'

export GOPATH="/mnt/Media/Programming/go"
export PATH="$PATH:$(go env GOPATH)/bin"
export LANG=en_US.utf8
PS1='\e[0;34m \u\e[m in\e[0;35m \W\e[m \e[33mλ\e[m '
