#!/bin/bash

if [ -z "$1" ]
then
	echo -e "Invalid usage.\n\033[1mUsage:\033[0m ./toogle-xinput.sh [id]"
	exit 128
fi

status="$(xinput list-props $1 | grep "Device Enabled")"
status="${status: -1}"

if [ $status -eq 0 ]
then
	xinput enable $1
else
	xinput disable $1
fi
