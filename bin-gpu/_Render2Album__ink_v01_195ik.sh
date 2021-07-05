#!/bin/bash
#@STCGoal An album montage is created and published from render in the cloud, an address is received for the Album along with a Contact sheet URL image
#@STCStatus Remodeling with Templating



export renderbatch="__Render2Album_conf__ink_v01_195ik.sh"

if [ "$renderbatch" == "" ] || [ ! -e "$renderbatch" ] ; then 
	echo "\$renderbatch must be defined already"
	exit 1
fi

echo "----- MIGHT WANT TO EDIT THAT FIRST, otherwise just quit and it will continue------------"
if [ "$1" == "" ] ; then vi $renderbatch ; fi
. $renderbatch && echo "Loaded $_" || (echo "Could not source $_" ; exit 1)


export LOG_FILE=/var/log/gia/LOGFILENAME.log
export LOG_ENABLED=y
DEBUG=0


. __Render2Album_EXEC_GLOBAL.sh
#$renderbatch

