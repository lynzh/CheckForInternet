#!/bin/sh
# Script to run a constant check for internet access
# Should be run as sudo if you want to interface with unicornhat


PING_CHECK=$(ping -c 1 -i 1 195.159.0.100 | awk '/1\ received/ { system("echo "$4) }')

RunCheck() { 
	
	if [ $PING_CHECK  = "1" ] ;
	then
		echo "## PARTY -- Connection UP ##";
	elif [ $PING_CHECK ! "1" ];
	then
		echo "## Error -- Connection DOWN ##"; 
	fi
}

RunCheck	
