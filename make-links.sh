#!/bin/bash
# @lsipii dotfiles installer

###
# Link vim and tmux and other configuration files
##
FILES=".vim
.vimrc
.tmux.conf
.bash_aliases
.bash_addons
";
SCRIPTSDIR=$(realpath ${0%/*})

for SYMLINK in $FILES
do		
	if [ ! -e ~/$SYMLINK ]; then
		ln -s $SCRIPTSDIR/$SYMLINK ~/$SYMLINK
	fi
done

###
# Install vim base16 theme
###
if [ ! -d $SCRIPTSDIR/.vim/colors/base16 ]; then
	git clone https://github.com/chriskempson/base16-vim.git $SCRIPTSDIR/.vim/colors/base16
fi

###
# Install bashit
###
if [ ! -d ~/.bash_it ]; then
	git clone --depth=1 https://github.com/Bash-it/bash-it.git $SCRIPTSDIR/.bash_it
	ln -s $SCRIPTSDIR/.bash_it ~/.bash_it
	~/.bash_it/install.sh --silent

	# Change bashit theme to rjorgenson
	sed -i "s/export BASH_IT_THEME='bobby'/export BASH_IT_THEME='rjorgenson'/g" ~/.bashrc
fi

###
# Apply aliases, addons etc
###

# bashrc include to bash_profile
if [[ -f ~/.bash_profile && ! $(grep -Fxq "source ~/.bashrc" ~/.bash_profile) ]]; then
	echo '
	if [ -f ~/.bashrc ]; then
	   source ~/.bashrc
	fi
	' >> ~/.bash_profile
fi

# bash_aliases include to bashrc
if [[ ! $(grep -Fxq "source ~/.bash_aliases" ~/.bashrc) ]]; then
	echo '
	if [ -f ~/.bash_aliases ]; then
	   source ~/.bash_aliases
	fi
	' >> ~/.bashrc
fi

# bash_addons include to bashrc
if [[ ! $(grep -Fxq "source ~/.bash_addons" ~/.bashrc) ]]; then
	echo '
	if [ -f ~/.bash_addons ]; then
	   source ~/.bash_addons
	fi
	' >> ~/.bashrc
fi