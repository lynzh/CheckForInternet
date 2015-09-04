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

#elif [ ! "$@" ] ; then
#	echo "Error, usage --"
#	echo "$0 <num>"
#	echo "eg; $0 0.5"
#	exit 1;
#fi


# Tests to be removed later

#
echo "\$DNS1 = $DNS1"
echo "\$DNS2 = $DNS2"
echo "\$DNS3 = $DNS3"

echo "\$PING_DNS1 = $PING_DNS1"
echo "\$PING_DNS2 = $PING_DNS2"
echo "\$PING_DNS3 = $PING_DNS3"


RunCheck() { 	
if [ $PING_DNS1  = "1" ] ;
then
	exit 0	
elif [ $PING_DNS1 ! "1" ];
then
	if [ $PING_DNS2  = "1" ] ;
	then
		exit 0	
	elif [ $PING_DNS2 ! "1" ];
	then
		if [ $PING_DNS3  = "1" ] ;
		then
			exit 0	
		elif [ $PING_DNS3 ! "1" ];
		then
			exit 1
		fi
	fi
fi
}
RunCheck	

