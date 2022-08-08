#!/usr/bin/env bash
# @lsipii installer (tested on ubuntu)
echo "INSTALLING CORE PACKAGES"
# Packages
sudo apt-get update && sudo apt-get -y install \
    tmux \
    htop \
    iftop \
    iotop \
    vim \
    git \
    mosh \
    build-essential \
    apcalc \
    curl \
    lolcat \
    figlet \
    fortune \
    cowsay \
    zsh \
    pass \
    httpie \
    nload \
    libncurses5-dev \
    postgresql-client \
    autojump \
    wget \
    sudo \
    gnupg2 \
    jq \
    fish

mkdir -p ~/.local/bin/