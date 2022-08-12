SHELL = /usr/bin/bash

install: install-base install-base-links
	@echo "> Installing base..."
	@echo "> Installing base links..."

clean: clean-base-links
	@echo "> Cleaning base links..."

install-base:
	./scripts/install-ubuntu-packages.sh
	./scripts/install-oh-my-zsh.sh
	./scripts/install-oh-my-tmux.sh

install-base-links:
	./scripts/install-base-configuration-links.sh "install"
clean-base-links:
	./scripts/install-base-configuration-links.sh "clean"


install-nodejs:
	./scripts/install-nodejs-with-n.sh

install-docker:
	./scripts/install-docker.sh
