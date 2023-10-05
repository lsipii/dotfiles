SHELL = /usr/bin/bash

install: install-base install-base-links ensure-ssh-key
	@echo "> Installing base..."
	@echo "> Installing base links..."

clean: clean-base-links
	@echo "> Cleaning base links..."

install-base:
	./scripts/install-ubuntu-packages.sh
	./scripts/install-oh-my-zsh.sh
	./scripts/install-oh-my-tmux.sh

ensure-default-ssh-key:
	./scripts/ensure-default-ssh-key.sh

install-base-links:
	./scripts/install-base-configuration-links.sh "install"
clean-base-links:
	./scripts/install-base-configuration-links.sh "clean"

install-nodejs:
	./scripts/install-nodejs-with-n.sh

install-docker:
	./scripts/install-docker.sh
