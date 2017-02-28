# some colors
RCol='\033[0m'

BRed='\033[1;31m'
BWhi='\033[1;37m';

Bla='\033[30m';
Red='\033[31m';
Gre='\033[32m';
Yel='\033[33m';
Blu='\033[34m';
Pur='\033[35m';
Cya='\033[36m';
Whi='\033[37m';

PS1="${RCol}┌─[\`if [ \$? = 0 ]; then echo "${Gre}"; else echo "${Red}"; fi\`\t\[${Rcol}\] \[${Blu}\]\h\[${RCol}\] \[${Yel}\]\w\[${RCol}\]]\n└─╼ "

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

# Automatically trim long paths in the prompt (requires Bash 4.x)
export PROMPT_DIRTRIM=2

# PATH
export PATH="${PATH}:${HOME}/bin"
#export PATH="${PATH}:${HOME}/.gem/ruby/2.4.0/bin"

if [[ -n $(which nvim) ]]
then
    export EDITOR="/usr/bin/nvim"
fi

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

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
export HISTSIZE="10000"
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:ll:cd:shutdown"
export HISTTIMEFORMAT='%F %T '

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# CD quick targets
CDPATH=".:~:/srv/http"

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

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
