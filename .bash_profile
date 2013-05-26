#
# PS1
#

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="[\w\[\033[31m\]\$(parse_git_branch)\[\033[00m\]]$\[\033[00m\] "

# terminal transparency
[ -n "$XTERM_VERSION" ] && transset-df -a 0.8 > /dev/null

# VirtualENVWrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

#
# Aliases
#

if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

#
# Misc
#
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# History verification
shopt -s histverify

# rearrange PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export PROMPT_COMMAND='history -a'

# fix for line wrapping
export LANG=en_US.UTF-8

# fix for mac's unreadable colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

