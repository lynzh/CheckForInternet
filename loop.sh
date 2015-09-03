#!/bin/sh
# Script to run a constant check for internet access

# Initialize our VARs
DNS1="195.159.0.100"
DNS2="195.159.0.100"
DNS3="4.4.4.4"

# Initialize our checks/pings
PING_DNS1=$(ping -c 1 -i 1 -t 10 ${DNS1} | awk '/received/ { system("echo "$4) }')
PING_DNS2=$(ping -c 1 -i 1 -t 10 ${DNS2} | awk '/received/ { system("echo "$4) }')
PING_DNS3=$(ping -c 1 -i 1 -t 10 ${DNS3} | awk '/received/ { system("echo "$4) }')

#elif [ ! "$@" ] ; then
#	echo "Error, usage --"
#	echo "$0 <num>"
#	echo "eg; $0 0.5"
#	exit 1;
#fi


# Tests to be removed later

#
echo "\$DNS1 = $DNS1"
echo "\$DNS1 = $DNS1"
echo "\$DNS1 = $DNS1"

echo "\$PING_DNS1 = $PING_DNS1"
echo "\$PING_DNS2 = $PING_DNS2"
echo "\$PING_DNS3 = $PING_DNS3"


RunCheck() { 	
if [ $PING_DNS1  = "1" ] ;
then
	exit 0	
elif [ $PING_DNS1 ! "1" ];
then
	exit 1
fi
}
RunCheck	

