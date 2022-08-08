#!/usr/bin/env bash
mkdir -p ~/.local/bin/

if [ ! -f ~/.local/bin/n ]; then

    echo "INSTALLING NODE"
    # Node
    mkdir -p ~/src && \
        cd ~/src && \
        [ ! -d n ] || rm -rf n && \
        git clone https://github.com/tj/n.git && \
        cd n && \
        PREFIX=~/.local make install && \
        cd && \
        rm -rf ~/src/n || exit 1

    export PATH=$PATH:$HOME/.local/bin
    export N_PREFIX=$HOME/.local
    n latest && \
        npm -v
fi