#!/usr/bin/env bash
mkdir -p ~/.local/bin/

if [ ! -f ~/.local/bin/tig ]; then

    echo "INSTALLING TIG"
    export TIG_VERSION=2.5.0
    mkdir -p ~/src && \
        cd ~/src && \
        [ ! -d tig-$TIG_VERSION ] || rm -rf tig-$TIG_VERSION && \
        wget https://github.com/jonas/tig/releases/download/tig-$TIG_VERSION/tig-$TIG_VERSION.tar.gz && \
        wget https://github.com/jonas/tig/releases/download/tig-$TIG_VERSION/tig-$TIG_VERSION.tar.gz.md5 && \
        md5sum -c tig-$TIG_VERSION.tar.gz.md5 || exit 1
        tar -xf tig-$TIG_VERSION.tar.gz && \
        cd tig-$TIG_VERSION && \
        make prefix=~/.local && \
        make install prefix=~/.local && \
        cd && \
        rm -rf ~/src/tig-$TIG_VERSION && \
        rm ~/src/tig-$TIG_VERSION.tar.gz && \
        rm ~/src/tig-$TIG_VERSION.tar.gz.md5
fi