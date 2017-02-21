#!/bin/bash

# some colors
RCol='\033[0m'
BRed='\033[1;31m'
Blu='\033[0;34m'
Gre='\033[0;32m'
BRed='\033[1;31m';

# prompt_style (inspired by the one from jason wryan)
PS1="${RCol}┌─[\[${BRed}\]\t\[${RCol}\] \[${Blu}\]\h\[${RCol}\] \[${Gre}\]\w\[${RCol}\]]\n└─╼ "

# attach/start tmux
function start_tmux {
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    # If tmux exists on the system, attach or create session
    if [[ -z "$TMUX" ]] && [[ -n $(which tmux) ]] 
    then
            t=`tmux has-session 2>&1`
            if [[ -z "$t" ]]
            then exec tmux -2 attach
            else exec tmux -2 new
            fi
    fi
}

# for server only
#start_tmux

# export variables
export PATH="${PATH}:${HOME}/bin"
#export PATH="${PATH}:${HOME}/.gem/ruby/2.4.0/bin"
if [[ -n $(which nvim) ]]
then
    export EDITOR="/usr/bin/nvim"
fi

# set pager conf
export LESS_TERMCAP_mb=$'\033[01;31m'
export LESS_TERMCAP_md=$'\033[01;31m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;32m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS="-RI"

# set history variables
unset HISTFILESIZE
HISTSIZE="10000"
HISTCONTROL=ignoreboth:erasedups

# some aliases
alias cd..='cd ..'
alias :q='exit'
alias cls='clear'
if [[ -n $(which curl 2>/dev/null) ]]
then
    alias ww='curl -s wttr.in'
fi
if [[ -z $(which exa 2>/dev/null) ]]
then
    alias ll='ls -lhb --color'
    alias lla='ls -alhb --color'
    alias llt='ls -lhbt --color'
else
    alias ll='exa -gl --git'
    alias lla='exa -agl --git'
    alias llt='exa -gl --git -s modified'
fi
alias nvim='nvim -p'
alias tmux='tmux -2'
if [[ -n $(which mpv 2>/dev/null) ]]
then
    alias play='mpv --no-video --loop '
fi
alias todo="nvim ${HOME}/.TODO"
if [[ -n $(which youtube-dl 2>/dev/null) ]]
then
    alias ytmp3='youtube-dl --extract-audio --audio-quality 3 --audio-format mp3'
fi

# completion with sudo
complete -cf sudo

# Greetings
if [[ -n $(which greeting 2>/dev/null) ]]
then
	greeting 2>/dev/null
fi
