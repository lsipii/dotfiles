#!/usr/bin/env bash
# @lsipii secrets linker
#
# usage notes: 
# expects the script file in the secrets root folder
# 

###
# Link very secrets to home dir
##
FILES=".ssh
.keys
.git-credentials
.password-store
";
SCRIPTSDIR=$(realpath ${0%/*})

for SYMLINK in $FILES
do	
	# Remove old if a link
	if [ -L ~/$SYMLINK ]; then
		rm ~/$SYMLINK 
	fi	

	# Ensure some permission levels
	chmod -R 600 $SCRIPTSDIR/$SYMLINK

	# Create new, throw error if exists
	ln -s $SCRIPTSDIR/$SYMLINK ~/$SYMLINK || exit 1
done