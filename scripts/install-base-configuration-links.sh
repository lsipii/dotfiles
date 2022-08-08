#!/usr/bin/env bash
# @lsipii dotfiles links installer
SCRIPTSDIR=$(realpath ${0%/*}/..)
CONFIGURATIONS_DIR="${SCRIPTSDIR}/configurations"

# Links dotfiles of configurations dir to home dir
for SYMLINK_FILEPATH in ${CONFIGURATIONS_DIR}/.*; do		
	SYMLINK_FILE=$(basename ${SYMLINK_FILEPATH})
	
    if [ "${SYMLINK_FILE}" == "." ] || [ "${SYMLINK_FILE}" == ".." ]; then
        continue;
    fi

    echo -n "Checking ${SYMLINK_FILE}.. "
	if [ -f ${CONFIGURATIONS_DIR}/${SYMLINK_FILE} ]; then
		if [ ! -e ${HOME}/${SYMLINK_FILE} ]; then
			ln -s ${CONFIGURATIONS_DIR}/${SYMLINK_FILE} ${HOME}/${SYMLINK_FILE} 
			echo -n "> Made a new link: ${HOME}/${SYMLINK_FILE}\n"
		else
			echo -n "> Link already exists: ${HOME}/${SYMLINK_FILE}\n"	
		fi
    else
        echo -n "> Invalid source file. \n"
	fi
done
