#!/usr/bin/env bash
###
# Install omg zoinks
###
if [ ! -d ~/.oh-my-zsh ]; then
	
	echo "Installing oh-my-zsh" && \
    cd && \
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
	curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors && \
	export ZSH_CUSTOM=.oh-my-zsh/custom && \
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions && \
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi