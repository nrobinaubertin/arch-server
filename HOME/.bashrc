# start tmux (for server)
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]] 
then
	t=`tmux has-session 2>&1`
	if [[ -z "$t" ]]
	then exec tmux -2 attach
	else exec tmux -2 new
	fi
fi

# my bin
export PATH="$PATH:~/bin"
export EDITOR="/usr/bin/vim"
#export BROWSER="/usr/bin/firefox"
#export MULTIPLEXER="/usr/bin/tmux"

# gem path
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# some aliases
alias lc='ls --color'
alias cd..='cd ..'
alias :q='exit'
alias cls='clear'
#alias son='alsamixer'
#alias wifi='sudo wifi-menu'
alias ll='ls -lhb --color'
alias lla='ls -alhb --color'
#alias dhc='sudo systemctl start dhcpcd.service'
alias timestamp='date +%s'
alias vim='vim -p'
alias tmux='tmux -2'
#alias cal='cal -m'
alias duhs='du -hs * | sort -h'
#alias play='mpv --no-video *.mp3'
alias todo='vim ~/.TODO'
alias pingoogle='ping 8.8.8.8'
alias less='less -r'
#alias zusam='cd /srv/http/zusam'
#alias dropbox='dropbox-cli start'
#alias bye='sudo shutdown -h now'

# completion with sudo
complete -cf sudo

echo "----------"
echo `date`
fortune -sn 70
echo "----------"
~/bin/archshot 2>/dev/null
echo "----------"
