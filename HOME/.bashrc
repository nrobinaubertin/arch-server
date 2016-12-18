# prompt_style (from jason wryan)
function set_prompt_style {
    if [[ -n "$SSH_CLIENT" ]]; then
        PS1="┌─[\[\e[0;34m\]\h\[\e[0m\] \[\e[1;33m\]\w:\[\e[0m\] \[\e[1;31m\]«SSH»\[\e[0m\]]\n└─╼ "
    else
        PS1="┌─[\[\e[34m\]\h\[\e[0m\] \[\e[32m\]\w\[\e[0m\]]\n└─╼ "
    fi
}

set_prompt_style

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
start_tmux

# export variables
export PATH="${PATH}:${HOME}/bin"
if [[ -n $(which nvim) ]]
then
    export EDITOR="/usr/bin/nvim"
fi

# set pager conf
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS="-RI"

# set history variables
unset HISTFILESIZE
HISTSIZE="10000"
HISTCONTROL=ignoreboth:erasedups

# some aliases
alias cd..='cd ..'
alias :q='exit'
alias cls='clear'
if [[ -n $(which exa 2>/dev/null) ]]
then
    alias ll='ls -lhb --color'
    alias lla='ls -alhb --color'
    alias llt='ls -lhbt --color'
else
    alias ll='exa -gl --git'
    alias lla='exa -agl --git'
    alias llt='exa -gl --git -s modified'
fi
alias timestamp='date +%s'
alias nvim='nvim -p'
alias tmux='tmux -2'
alias duhs='du -hs * | sort -h'
alias ds='du -hs'
if [[ -n $(mpv 2>/dev/null) ]]
then
    alias play='mpv --no-video *.mp3'
fi
alias todo="nvim ${HOME}/.TODO"
if [[ -n $(youtube-dl 2>/dev/null) ]]
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
