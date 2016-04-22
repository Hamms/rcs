#!/bin/bash

RCS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
files=(.bash_aliases .bash_profile .bashrc .gitconfig .git-prompt.sh .inputrc);
for file in "${files[@]}"; do
    dest="$HOME/$file"
    if [ -L $dest ]; then
        target=$(file $dest | awk '{print $5}')
        echo "$file already exists and is pointing to $target; skipping"
        continue
    fi
    if [ -f $dest ]; then
        read -r -p "$file already exists; replace? [Y/n] " response
        if [[ $response =~ ^([nN])$ ]]
        then
            echo "okay, skipping $file"
            continue
        else
            echo "okay, replacing $file"
            mv $dest "$RCS_DIR/backup/$file"
            echo "$dest backed up to ./backup"
        fi
    fi
    ln -s "$RCS_DIR/$file" "$HOME"
    echo "$file installed"
done
