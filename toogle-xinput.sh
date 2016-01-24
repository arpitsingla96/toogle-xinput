#!/bin/bash


# $1=title, $2=message, $3=time, $4=exit_code
function notify {
	echo -e "$2"
	de=$DESKTOP_SESSION
	if [[ $de = "plasma" ]]
		then
		kdialog --title "$1" --passivepopup "$2" $3 &
	fi
	exit $4
}

# if no argument is passed
if [ -z "$1" ]
	then
	notify "toogle-xinput.sh" "Invalid command.\nUsage: ./toogle-xinput.sh [id]" 5 1
fi

check_id="$(xinput list | grep "id=$1")"

# if there does not exist any input device corresponding to the given id
if [ -z "$check_id" ]
	then
	notify "toogle-xinput.sh" "Invalid id.\nUse \"xinput list\" to see available ids." 5 1
fi

# get enabled status
status="$(xinput list-props $1 | grep "Device Enabled")"
status="${status: -1}"
# regex matching to get the name of input device
pattern='((\w+\s+)+)\s+id=10'
[[ "$(xinput list)" =~ $pattern ]]

if [ $status -eq 0 ]
	then
	xinput enable $1
	notify "toogle-xinput.sh" "Enabled Input: ${BASH_REMATCH[1]}" 5 0
else
	xinput disable $1
	notify "toogle-xinput.sh" "Disalbed Input: ${BASH_REMATCH[1]}" 5 0
fi
