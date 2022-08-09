#!/usr/bin/env bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3 python3-pip
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
