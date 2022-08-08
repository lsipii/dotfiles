#!/usr/bin/env bash
# @lsipii dotfiles links installer
SCRIPTSDIR=$(realpath ${0%/*}/..)
CONFIGURATIONS_DIR="${SCRIPTSDIR}/configurations"

# Links dotfiles of configurations dir to home dir
for SYMLINK_FILE in ${CONFIGURATIONS_DIR}/.*; do		
	echo "Cheking.. ${SYMLINK_FILE}"
	if [ -f ${CONFIGURATIONS_DIR}/${SYMLINK_FILE} ]; then
		if [ ! -e ${HOME}/${SYMLINK_FILE} ]; then
			ln -s ${CONFIGURATIONS_DIR}/${SYMLINK_FILE} ${HOME}/${SYMLINK_FILE} 
			echo "Made a new link: ${HOME}/${SYMLINK_FILE}"
		else
			echo "Link already exists: ${HOME}/${SYMLINK_FILE}"	
		fi
	fi
done
