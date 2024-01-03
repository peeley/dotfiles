#!/bin/zsh

bindkey ";3D" backward-word # Option+<- on mac
bindkey ";3C" forward-word # Option+-> on mac

alias vim="nvim"
alias dotfiles="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias up="yay -Syu --noconfirm --sudoloop"
alias ls='eza --color=always --group-directories-first -lh'
alias g="git"
alias grep="rg"
alias cat="bat --theme=ansi --style=changes"
alias bc="bc -l"
alias sail="./vendor/bin/sail"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/i386elfgcc"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/kitty.app/Contents/MacOS:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"

[[ $- != *i* ]] && return

export LANG=en_US.utf8
export EDITOR=vim
export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

# starship prompt
eval "$(starship init zsh)"

# start direnv
eval "$(direnv hook zsh)"

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
