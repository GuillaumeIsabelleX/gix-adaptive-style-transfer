#### Which has the following var
#Determine where we will save in $resultroot
export savedirnamespace=gia-ds-pierret_ds_210512-864-v02-210527-864
#subdir of this render in the namespace above
export ftag=pt_v02
#The model store we will be using
#model_gia-ds-pierret_ds_210512-864-v02-210527-864_new
export modeltag=model_gia-ds-pierret_ds_210512-864-v02-210527-864_new

##########################################
####### WHAT TO RENDER IS DEFINED HERE ##
# <Source content path>,<resolution>;
# /a/lib/datasets/SmallCreation,520;
# /a/lib/samples/sc,600;
# LIBROOT = /a/lib
# LIBRESULT = /a/lib/results
# LIBSAMPLES = /a/lib/samples
# LIBDATASETS = /a/lib/datasets

export container_arc=cpu

read -r -d '' _TORENDER << RENDERME
# /a/lib/samples/contentslimmer,1600;
# SAVEDIRBASE/1600x,2210;
RENDERME

# /a/lib/samples/content,2200;
# SAVEDIRBASE/640x,2095;

# /a/lib/samples/sc210518,640;
# /a/lib/samples/content,2200;
# /a/lib/samples/content,576;
# /a/lib/samples/sc,710;

# /a/lib/samples/content,576;
# /a/lib/samples/sc,710;
# /a/lib/datasets/SmallCreation,720;
# /a/lib/samples/sc210518,640;
#RENDERME

# /a/lib/samples/sc,600;
read -r -d '' IGNORED << DISABLED_KEEPASREFEFERENCE

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
echo "savedirbase:$savedirbase"
echo "savefullpath:$savefullpath"
DISABLED_KEEPASREFEFERENCE


# DONT TOUCH THIS
# export TORENDER=$(echo "$_TORENDER" | sed -e 's/\#//g' |  sed -e 's/ //g')
