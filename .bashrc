# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -r "/etc/bash_completion.d/git" ]; then
    . /etc/bash_completion.d/git
    PS1="\h: [\$(__git_ps1 \"%s) \")\W] \u\\$ "
fi

# User specific aliases and functions
# System wide aliases
alias rm='/bin/rm -i'
alias cp='/bin/cp -i'
alias mv='/bin/mv -i'
alias ls='/bin/ls -la --color=auto'

export HISTIGNORE="fg*:bg*:history*:ls -la:rm*"
export HISTCONTROL=ignoredups
export HISTSIZE=10000
