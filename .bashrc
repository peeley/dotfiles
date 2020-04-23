#
# ~/.bashrc
#

bind :clear-screen

alias up="yay -Syu --noconfirm --sudoloop"
alias ls='exa --color=always --group-directories-first -lh'
alias g="git"
alias grep="rg"
alias cat="bat --theme=ansi-dark --style=changes"
alias bc="bc -l"
alias emacs="emacs -nw"

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
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export MANPATH="$MANPATH:/opt/texlive/2019/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/opt/texlive/2019/texmf-dist/doc/info"

[[ $- != *i* ]] && return

export LANG=en_US.utf8

source ~/git-completion.bash

export PS1=" \[\e[34m\]\u\[\e[m\] in \[\e[35m\]\W\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\] λ \[\e[m\]"
