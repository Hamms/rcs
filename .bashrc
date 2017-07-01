# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#
# Aesthetics
#

# terminal transparency
[ -n "$XTERM_VERSION" ] && transset -a 0.8 > /dev/null

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# fix for line wrapping
export LANG=en_US.UTF-8

# fix for mac's unreadable colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#
# History
#

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%Y%m%d %T  "
export PROMPT_COMMAND='history -a'

# append to the history file, don't overwrite it
shopt -s histappend

# History verification
shopt -s histverify


#
# Productivity
#

set -o vi

# rearrange PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:$EC2_HOME/bin 
export PS1="[\w\[\033[31m\]\$(__git_ps1)\[\033[00m\]]$\[\033[00m\] "
export EDITOR=vim

# AWS
if [ -f $HOME/.aws_config ]; then
    source $HOME/.aws_config
fi

# Chef
export CDO_CHEF_NODE_NAME="ehamovitz"

# RBENV
export PATH=$HOME/.rbenv/bin:$PATH

# relative node_modules
export PATH=node_modules/.bin:$PATH

# local binaries
export PATH=$HOME/bin:$HOME/bin/node_modules/.bin:$PATH

## VirtualENVWrapper
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#    source /usr/local/bin/virtualenvwrapper.sh
#fi

if [ -f $HOME/.git-prompt.sh ]; then
    source $HOME/.git-prompt.sh
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


