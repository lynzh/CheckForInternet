#!/bin/sh
# Script to run a constant check for internet access

# initial echos

if [ "$@" ] ; then
	while sleep "$@";
	do
	clear;
	echo "## Terminate with ^C or Ctrl+c ## "

PING_CHECK=$(ping -c 1 -i 1 -t 10 195.159.0.100 | awk '/received/ { system("echo "$4) }')
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

PING_TEST=$(ping -c 1 -i 1 -t 10 123.123.123.142 | awk '/received/ { system("echo "$4) }')
Runtest() { 
	
	if [ $PING_TEST  = "1" ] ;
	then
		echo "## TEST -- Connection UP ##";
	elif [ $PING_TEST = "0" ];
	then
		echo "## TEST -- Connection DOWN ##"; 
	fi
}

Runtest
	done

elif [ ! "$@" ] ; then
	echo "Error, usage --"
	echo "$0 <num>"
	echo "eg; $0 0.5"
	exit 1;
fi	
