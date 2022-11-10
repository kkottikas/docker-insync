#!/bin/bash

	set -x
	
	echo 'Starting Insync'
	insync-headless start

	sleep 5
	
	# check if account already exists
	account_exists=$(insync-headless account list)
	
	
	if [[ $account_exists == *"No accounts added yet"* ]]; then

		echo "Adding account ${INSYNC_USERNAME} with auth code: ${INSYNC_AUTH_CODE}"
		mkdir -p "/data/${INSYNC_USERNAME}"
		insync-headless account add -a ${INSYNC_AUTH_CODE} -p /data/${INSYNC_USERNAME} -e ${INSYNC_DOWNLOAD} -c ${INSYNC_CLOUD_PROVIDER}

		#if [[ $add_output = "Error"* ]] || [[ $add_output = *"error"* ]] || [[ $add_output = "Sorry"* ]]; then
		#	echo 'Error detected, exiting with code 1'
		#	exit 1
		#else
			# run forever since insync-headless is running in the background
			tail -f /root/.config/Insync-headless/out.txt || tail -f /dev/null
		#fi
	else
		#insync-headless account list
		echo "Insync account ${INSYNC_USERNAME} already added"
		tail -f /root/.config/Insync-headless/out.txt || tail -f /dev/null
	fi
