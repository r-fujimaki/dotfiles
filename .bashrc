# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# System wide aliases
alias rm='/bin/rm -i'
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'

# OSでオプション分岐
if ["$(uname) == 'Darwin'"]; then
	alias ls='/bin/ls -laG'
else
	alias ls='/bin/ls -la --color=auto'
fi


export HISTIGNORE="fg*:bg*:history*:ls -la:rm*"
export HISTCONTROL=ignoredups
export HISTSIZE=10000
