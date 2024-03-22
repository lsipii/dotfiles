#!/usr/bin/env bash
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

mkdir -p aws-sam-cli
cd aws-sam-cli && \
curl -LO "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" && \
unzip aws-sam-cli-linux-x86_64.zip && \
sudo ./install --update && \
cd .. && \
rm -rf ./aws-sam-cli
