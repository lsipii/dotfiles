#!/bin/bash
## Links to home with some path assumptions
FILES=".vim
.vimrc
.tmux.conf
";
SCRIPTSDIR=`dirname "$BASH_SOURCE"`

for SYMLINK in $FILES
do		
	if [ ! -e ~/$SYMLINK ]; then
		ln -s $SCRIPTSDIR/$SYMLINK ~/$SYMLINK
	fi
done

## Extend .bash_profile
if [ -f ~/.bash_profile ]; then
	if ! grep -q "BASH_PROFILE_IS_EXTENDED" ~/.bash_profile; then
		cat $SCRIPTSDIR/.bash_profile_ext >> ~/.bash_profile
	fi
elif [ -f ~/.profile ]; then
	if ! grep -q "BASH_PROFILE_IS_EXTENDED" ~/.profile; then
		cat $SCRIPTSDIR/.bash_profile_ext >> ~/.profile
	fi
else
	touch ~/.bash_profile
	echo '#!/bin/bash' > ~/.bash_profile
	echo '
	if [ -f ~/.bashrc ]; then
	   source ~/.bashrc
	fi
	' >> ~/.bash_profile
	cat $SCRIPTSDIR/.bash_profile_ext >> ~/.bash_profile
fi