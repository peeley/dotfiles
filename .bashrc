#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\e[0;34m \u\e[m in\e[0;35m \W\e[m \e[33m\$\e[m '
