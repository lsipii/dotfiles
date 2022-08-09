#!/usr/bin/env bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1