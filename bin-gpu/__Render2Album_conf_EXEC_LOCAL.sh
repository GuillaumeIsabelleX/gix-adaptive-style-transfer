#!/bin/bash

echo "Entering $0"
echo "fname:$fname"
echo "modelname:$modelname"

if [ "$chks" == "CHKS" ] ||  [ "$chks" == "" ]; then export chks="$chksFULL"; fi 

export ftag=$fname'-'$reso$fsuffix


export savedirnamespace=${ds//"gia-ds-"/}

# Ways to override it
if [ "$SAVEDIRNAMESPACE" != "" ] ;then export savedirnamespace="$SAVEDIRNAMESPACE" ; fi


#got modelname from Dataset
if [ "$modelname" == "" ] ||  [ "$modelname" == "DS" ]; then  export modelname='model_'$ds'_new'; fi
export modeltag=$modelname





export container_arc=cpu
if [ -e "/a/lib/__tmpdbg" ] ; then 
	rm -rf /a/lib/__tmpdbg 
fi

mkdir -p /a/lib/__tmpdbg
if [ -d "$contentpath" ]; then #@state We have a dir 
	cp $contentpath/* /a/lib/__tmpdbg
else
	cp $contentpath /a/lib/__tmpdbg
fi
resox=$reso'x'
read -r -d '' _TORENDER << R
# /a/lib/__tmpdbg,$reso
R

# SAVEDIRBASE/$resox,2300;
# /a/lib/samples/content,576;

