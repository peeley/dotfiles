#!/bin/bash

bind :clear-screen

alias up="yay -Syu --noconfirm --sudoloop"
alias ls='exa --color=always --group-directories-first -lh'
alias g="git"
alias grep="rg"
alias cat="bat --theme=ansi --style=changes"
alias bc="bc -l"
alias ssh="kitty +kitten ssh"
alias cprss="scp ~/.doom.d/elfeed.org bodo@192.168.1.21:~/.doom.d/elfeed.org"

alias webcam="sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0"

yank(){
    cat "$1" | xclip -selection c;
}

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:/usr/local/i386elfgcc
if [ "$HOSTNAME" = "skynet" ]; then
    export PATH=$PATH:/mnt/Media/Programming/go/bin
    export GOPATH=/mnt/Media/Programming/go
else 
    export PATH=$PATH:$HOME/Programming/go/bin
    export GOPATH=$HOME/Programming/go
fi

export PATH="$PATH:/opt/texlive/2019/bin/x86_64-linux"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export MANPATH="$MANPATH:/opt/texlive/2019/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/opt/texlive/2019/texmf-dist/doc/info"

export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
[[ $- != *i* ]] && return

export LANG=en_US.utf8

source ~/git-completion.bash

export PS1=" \[\e[34m\]\u\[\e[m\] in \[\e[35m\]\W\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\] λ \[\e[m\]"
