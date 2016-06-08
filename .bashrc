# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export RACK_SITE=bezeq

source ~/.git-prompt.sh
PS1='\[\e[32m\]\u@\h \[\e[34m\][\W] $(__git_ps1 "\[\e[91m\][%s]")\[\e[39m\]\$ '

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
    PS1='${debian_chroot:+($debian_chroot)} '$PS1
fi

# Aliases
#alias vim='vimx'
alias vim='nvim'
alias ack='ack --nogroup'
