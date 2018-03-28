#!/usr/bin/env bash
# @lsipii secrets linker
# Links the very secrets of running dir files and folders to ~
#
# usage notes: 
# expects the script file in the secrets root folder
# 

###
# Secret folders, links files in the folder
##
SYMLINKDIRS=(".ssh .gnupg")

###
# "Do not link but copy" exceptions for symlink dirs 
##
declare -A SYMLINKDIRS_DNLBC_EXCEPTIONS
SYMLINKDIRS_DNLBC_EXCEPTIONS[".ssh"]="config"
SYMLINKDIRS_DNLBC_EXCEPTIONS[".gnupg"]="gpg.conf"

###
# Secret files/folders, links directly
##
SYMLINKS=(".keys .git-credentials .password-store")

###
# Link destination folder == scripts running folder
##
LINK_DEST=$(realpath ${0%/*})

# Link direct links
for SYMLINK in ${SYMLINKS[@]}
do	
	# Remove old if a link
	if [ -L ~/${SYMLINK} ]; then
		rm ~/${SYMLINK} 
	fi	

	# Ensure some permission levels
	#chmod -R 600 ${LINK_DEST}/${SYMLINK}

	# Create new, throw error if exists
	ln -s ${LINK_DEST}/${SYMLINK} ~/${SYMLINK}
done

# Link subfolder links
for SYMLINKDIR in ${SYMLINKDIRS[@]}
do	
	# Remove old if a link
	if [ -L ~/${SYMLINKDIR} ]; then
		rm ~/${SYMLINKDIR} 
	fi	

	# Create folder if not exists
	if [ ! -d ~/${SYMLINKDIR} ]; then
		mkdir ~/${SYMLINKDIR}

		# Ensure some very secret permission levels
		chmod -R 700 ~/${SYMLINKDIR}
	fi

	for SYMLINKFILEPATH in ${LINK_DEST}/${SYMLINKDIR}/*
	do
		# Use basename
		SYMLINKFILE=$(basename ${SYMLINKFILEPATH})

		# Check for copy exceptions
		COPY_INSTEAD="FALSE"
		for EXCEPTION in "${SYMLINKDIRS_DNLBC_EXCEPTIONS[@]}"
		do
			if [ "${SYMLINKFILE}" == "${EXCEPTION}" ]; then
				COPY_INSTEAD="TRUE"
				break;
			fi
		done

		if [ "${COPY_INSTEAD}" == "TRUE" ]; then

			# Remove old if a link
			if [ -f ~/${SYMLINKDIR}/${SYMLINKFILE} ]; then
				rm ~/${SYMLINKDIR}/${SYMLINKFILE} 
			fi	

			# Create new, throw error if exists
			cp ${LINK_DEST}/${SYMLINKDIR}/${SYMLINKFILE} ~/${SYMLINKDIR}/${SYMLINKFILE}

			# Ensure some very secret permission levels
			chmod 600 ~/${SYMLINKDIR}/${SYMLINKFILE}

			# Onward with the linking loop
			continue;
		fi

		# Remove old if a link
		if [ -L ~/${SYMLINKDIR}/${SYMLINKFILE} ]; then
			rm ~/${SYMLINKDIR}/${SYMLINKFILE} 
		fi	

		# Ensure some permission levels
		# chmod -R 600 ${LINK_DEST}/${SYMLINKDIR}/${SYMLINKFILE}

		# Create new, throw error if exists
		ln -s ${LINK_DEST}/${SYMLINKDIR}/${SYMLINKFILE} ~/${SYMLINKDIR}/${SYMLINKFILE}
	done
done