#!/usr/bin/env bash
# @lsipii dotfiles links installer
SCRIPTS_DIR=$(realpath ${0%/*}/..)
CONFIGURATIONS_DIR="${SCRIPTS_DIR}/configurations"

OPERATION="${1}" || "install"


# Links dotfiles of configurations dir to home dir
for SYMLINK_FILEPATH in ${CONFIGURATIONS_DIR}/.*; do		
	SYMLINK_FILE=$(basename ${SYMLINK_FILEPATH})
	
    if [ "${SYMLINK_FILE}" == "." ] || [ "${SYMLINK_FILE}" == ".." ]; then
        continue;
    fi

    echo -n "Checking ${SYMLINK_FILE} .. "
	if [ ! -L ${HOME}/${SYMLINK_FILE} ] || [ ! -e ${HOME}/${SYMLINK_FILE} ]; then
		if [ -f ${HOME}/${SYMLINK_FILE} ] || [ -d ${HOME}/${SYMLINK_FILE} ]; then
			mv ${HOME}/${SYMLINK_FILE} ${HOME}/${SYMLINK_FILE}.pre-script-install
			echo "> Created a backup: ${HOME}/${SYMLINK_FILE}.pre-script-install"
		fi

		if [ "${OPERATION}" == "install" ]; then
			ln -s ${CONFIGURATIONS_DIR}/${SYMLINK_FILE} ${HOME}/${SYMLINK_FILE} && echo "> Made a new link: ${HOME}/${SYMLINK_FILE}"
		else
			rm ${HOME}/${SYMLINK_FILE} && echo "> Removed old link: ${HOME}/${SYMLINK_FILE}"
		fi
	else
		echo "> Link already exists"
	fi
done
