#!/bin/bash

echo "--->> Entering __Render2Album_conf_EXEC_LOCAL.sh"
echo "fname:$fname"
echo "modelname:$modelname"

if [ "$chks" == "CHKS" ] ||  [ "$chks" == "" ] ||  [ "$chks" == "ALL" ]; then export chks="$chksFULL"; fi 

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
export resox=$reso'x'
read -r -d '' __TORENDER << R
# /a/lib/__tmpdbg,$reso
R
export img_size=$reso

export _TORENDER="$__TORENDER"
echo "_TORENDER=$_TORENDER"
sleep 3
# SAVEDIRBASE/$resox,2300;
# /a/lib/samples/content,576;

