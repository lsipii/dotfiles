#!/usr/bin/env bash
###
# Install omg zoinks
###
if [ ! -d ~/.tmux ]; then
	echo "Installing oh-my-tmux"
	cd
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
fi