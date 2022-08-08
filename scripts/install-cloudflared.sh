#!/usr/bin/env bash
# @see: https://pkg.cloudflare.com/#ubuntu-title

echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/ $(lsb_release -c | awk '{print $2}') main" | sudo tee /etc/apt/sources.list.d/cloudflare-main.list

sudo curl https://pkg.cloudflare.com/cloudflare-main.gpg -o /usr/share/keyrings/cloudflare-main.gpg

sudo apt update
sudo apt install cloudflared