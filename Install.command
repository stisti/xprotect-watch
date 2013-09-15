#!/bin/bash -eu
#
# Install XProtect Watch launch agents
#
DIR=$(dirname "$0")
cd "$DIR"
mkdir -p ~/Library/LaunchAgents
for plist in xprotect_watch_*.plist; do
    cp $plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/$plist
done

if type -p growlnotify >/dev/null; then
    :
else
    echo
    echo "Growl and growlnotify are required for XProtect Watch notifications."
    echo
    echo "ERROR: growlnotify not found. Download it from http://growl.info/downloads"
    echo "       and install it into /usr/local/bin"
    echo
    open "http://growl.info/downloads"
fi
