#!/usr/bin/env bash
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

mkdir -p awscli
cd awscli && \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install --update && \
cd .. && \
rm -rf ./awscli
