# toogle-xinput
A simple bash script to toogle [ON/OFF] an input device listed in xinput

## Usage
1. Download the script.
2. Run `xinput list` to see a list of available input devices and note the id of the device you want to toogle.
3. Make the script executable using `chmod +x toogle-input.sh`.
4. Run `./toogle-xinput.sh [id]` to toogle that input device.
5. Create a custom keyboard shortcut for this command.

## Features
- Sends an event notification on:
  * KDE
  * Ubuntu
