#!/usr/bin/env bash
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C "" -f ~/.ssh/id_rsa -N ""
fi