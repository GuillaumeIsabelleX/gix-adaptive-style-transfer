#!/bin/bash

export contentpath=/a/lib/datasets/pierret_ds_210512-jpg/pt_IMG_4521.jpg

export reso=512
export fname=dbg_v01b3
export fsuffix='-2106150432'
export chks="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300 315 330 345 360 375 390 405"

export ftag=$fname-$reso$fsuffix

export modeltag=model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new

#export savedirnamespace=${ds//"gia-ds-"/}
export savedirnamespace=gia-ds-DavidBouchardGagnon-v01b-210510-864

ds=gia-ds-DavidBouchardGagnon-v01b-210510-864


export modelname='model_'$ds'_new'
#export modeltag=$modelname



#/a/lib/datasets/pierret_ds_210512

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
read -r -d '' _TORENDER << R
# /a/lib/__tmpdbg,$reso
R
# /a/lib/samples/contentslimmer,1024;
# /a/lib/samples/sc-21050101,$reso

# /a/lib/samples/content0025,1250;
# SAVEDIRBASE/1250x,2222
#RENDERME
# SAVEDIRBASE/2300x,2323;

# /a/lib/samples/sc,1788;
# SAVEDIRBASE/1788x,2300;
# SAVEDIRBASE/2300x,2323;
# /a/lib/samples/content,1111;
# /a/lib/samples/content,576;
# /a/lib/datasets/SmallCreation,720;
#RENDERME
# SAVEDIRBASE/1111x,1911;
# SAVEDIRBASE/1911x,2311;
# SAVEDIRBASE/720x,2100;
# SAVEDIRBASE/1111x,2100;


# /a/lib/samples/content,576;
# /a/lib/samples/sc,1710;
# /a/lib/samples/sc,710;
# /a/lib/datasets/SmallCreation,720;
# /a/lib/samples/sc210518,640;
#RENDERME

# /a/lib/samples/sc,600;


# SAVEDIRBASE/720x,2100;
# SAVEDIRBASE/640x,2095;

# /a/lib/samples/sc,1710;
# /a/lib/samples/sc,2110;
# /a/lib/datasets/SmallCreation,720;
# /a/lib/samples/sc210518,640;

# SAVEDIRBASE/719x,2090;
# SAVEDIRBASE/710x,2200;
# /a/lib/samples/content,576;
# SAVEDIRBASE/600x,2000;
# BELLOW ARE DISABLED, useful to keep those you dont want to process
# /a/lib/samples/content,576;
# /a/lib/results/gia-ds-pierret_ds_210512-864-v01-210517-864/pt_v01/576x,2200;
# /a/lib/results/gia-ds-pierret_ds_210512-864-v01-210517-864/pt_v01/520x,2200;
# SAVEDIRBASE/520x,2200;
# /a/lib/results/gia-ds-pierret_ds_210512-864-v01-210517-864/pt_v01/520x,2200;



# DONT TOUCH THIS
# export TORENDER=$(echo "$_TORENDER" | sed -e 's/\#//g' |  sed -e 's/ //g')