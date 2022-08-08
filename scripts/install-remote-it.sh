#!/usr/bin/env bash
mkdir remoteittmp
cd remoteittmp
curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
chmod +x ./auto-install.sh
sudo ./auto-install.sh
cd ..
rm -rf remoteittmp
