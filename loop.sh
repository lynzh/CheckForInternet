#!/bin/sh
# Script to run a constant check for internet access

# Initialize our VARs
DNS1="195.159.0.100"
DNS2="178.62.149.188"
DNS3="8.8.8.8"

# Initialize our checks/pings
PING_DNS1=$(ping -c 1 -w 1 ${DNS1} | awk '/received/ { system("echo "$4) }')
PING_DNS2=$(ping -c 1 -w 1 ${DNS2} | awk '/received/ { system("echo "$4) }')
PING_DNS3=$(ping -c 1 -w 1 ${DNS3} | awk '/received/ { system("echo "$4) }')

RunCheck() { 	
if [ $PING_DNS1  = "1" ];
then
	exit 0 # if connectivity exists to $DNS1, exit with no errors	
elif [ $PING_DNS1 ! "1" ];
then
	if [ $PING_DNS2  = "1" ];
	then
		exit 0 # OR if DNS1 fails, check for DNS2	
	elif [ $PING_DNS2 ! "1" ];
	then
		if [ $PING_DNS3  = "1" ];
		then
			exit 0 # if attempts at connctivity fails here, all the internet
						 # is down OR something is wrong with our network
		elif [ $PING_DNS3 ! "1" ];
		then
			exit 1
		fi
	fi
fi
}

# Runs RunCheck()
RunCheck 

