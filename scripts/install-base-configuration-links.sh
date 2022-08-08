#!/usr/bin/env bash
# @lsipii dotfiles links installer
SCRIPTS_DIR=$(realpath ${0%/*}/..)
CONFIGURATIONS_DIR="${SCRIPTS_DIR}/configurations"

[ -f ${HOME}/.zshrc ] && [ ! -e ${HOME}/.zshrc ] && mv ${HOME}/.zshrc ${HOME}/.zshrc.pre-script-install

# Links dotfiles of configurations dir to home dir
for SYMLINK_FILEPATH in ${CONFIGURATIONS_DIR}/.*; do		
	SYMLINK_FILE=$(basename ${SYMLINK_FILEPATH})
	
    if [ "${SYMLINK_FILE}" == "." ] || [ "${SYMLINK_FILE}" == ".." ]; then
        continue;
    fi

    echo -n "Checking ${SYMLINK_FILE} .. "
	if [ ! -e ${HOME}/${SYMLINK_FILE} ]; then
		if [ -f ${HOME}/${SYMLINK_FILE} ] || [ -d ${HOME}/${SYMLINK_FILE} ]; then
			echo "> Filepath already exists: ${HOME}/${SYMLINK_FILE}"
			continue;
		fi
		ln -s ${CONFIGURATIONS_DIR}/${SYMLINK_FILE} ${HOME}/${SYMLINK_FILE} && echo "> Made a new link: ${HOME}/${SYMLINK_FILE}"
	else
		echo "> Link already exists"
	fi
done
