# ~/.bash_profile: executed by bash(1) for login shells.

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

# terminal transparency
[ -n "$XTERM_VERSION" ] && transset-df -a 0.8 > /dev/null

