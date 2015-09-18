# my bin
export PATH="$PATH:~/bin"
export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/elinks"
export MULTIPLEXER="/usr/bin/tmux"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"

# some aliases
alias lc='ls --color'
alias cd..='cd ..'
alias :q='exit'
alias cls='clear'
alias :t='transset-df 1 -a 1>/dev/null'
alias :tt='transset-df 0.75 -a 1>/dev/null'
alias son='alsamixer'
alias wifi='sudo wifi-menu'
alias rss='newsbeuter'
alias ll='ls -lhb --color'
alias dhc='sudo systemctl start dhcpcd.service'
alias timestamp='date +%s'
alias vim='vim -p'
alias tmux='tmux -2'
alias todo='vim ~/.TODO'

# Fast shutdown
#alias bye='sudo umount /mnt; sudo umount /mnt2; sudo shutdown -h now'

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
archshot 2>/dev/null
echo "----------"
