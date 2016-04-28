# start tmux (for server)
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]] 
then
	t=`tmux has-session 2>&1`
	if [[ -z "$t" ]]
	then exec tmux attach
	else exec tmux new
	fi
fi

# my bin
export PATH="$PATH:~/bin"
export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/firefox"
export MULTIPLEXER="/usr/bin/tmux"

# gem path
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# some aliases
alias lc='ls --color'
alias cd..='cd ..'
alias :q='exit'
alias cls='clear'
#alias :t='transset-df 1 -a 1>/dev/null'
#alias :tt='transset-df 0.75 -a 1>/dev/null'
#alias son='alsamixer'
#alias wifi='sudo wifi-menu'
alias ll='ls -lhb --color'
alias la='ls -alhb --color'
#alias dhc='sudo systemctl start dhcpcd.service'
alias timestamp='date +%s'
alias vim='vim -p'
alias tmux='tmux -2'
alias cal='cal -m'
alias duhs='du -hs * | sort -h'
#alias play='mpv --no-video *.mp3'
#alias getwebsite='wget --recursive --no-clobber --page-requisites --html-extension --convert-links --no-parent'
alias todo='vim ~/.TODO'
alias pingoogle='ping 8.8.8.8'
#alias flux='redshift -l 48:2.3 1>/dev/null 2>/dev/null &' 
alias zusam='cd /srv/http/zusam'
#alias dropbox='dropbox-cli start'
#alias bye='sudo shutdown -h now'
#alias vim='nvim -p'

# cd and ls in one
cl() {
	if [[ -d "$1" ]]
	then
		cd "$1"
		ls
	else
		echo "bash: cl: '$1':Directory not found"
	fi
}

# completion ith sudo
complete -cf sudo

# transparency
#[ -n "$XTERM_VERSION" ] && transset-df -a .75 >/dev/null
#:t

echo "----------"
echo `date`
fortune -sn 70
echo "----------"
~/bin/archshot 2>/dev/null
echo "----------"
