#!/bin/bash
## Links to home with some path assumptions
FILES=".vim
.vimrc
.tmux.conf
.bash_profile
";
SCRIPTSDIR=`dirname "$BASH_SOURCE"`

for SYMLINK in $FILES
do		
	if [ ! -e ~/$SYMLINK ]; then
		ln -s $SCRIPTSDIR/$SYMLINK ~/$SYMLINK
	fi
done