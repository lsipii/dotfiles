#!/usr/bin/env bash
set -e

VERSION=0.41.0
echo "Installing wtfutils ${VERSION}"

WANTSPATH="$HOME/.local/bin"
mkdir -p ${WANTSPATH}

mkdir -p ~/src/wtfutil && \
cd ~/src/wtfutil

wget https://github.com/wtfutil/wtf/releases/download/v${VERSION}/wtf_${VERSION}_linux_amd64.tar.gz
tar -xvzf wtf_${VERSION}_linux_amd64.tar.gz
mv wtf_${VERSION}_linux_amd64/wtfutil $WANTSPATH/

cd
rm -rf ~/src/wtfutil