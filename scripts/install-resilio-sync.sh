#!/usr/bin/env bash
# https://help.resilio.com/hc/en-us/articles/206178924

##
# Resilio sync
##
echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
curl -LO http://linux-packages.resilio.com/resilio-sync/key.asc && sudo apt-key add ./key.asc

sudo apt-get update
sudo apt-get install resilio-sync
