
if [ "$1" == "" ] || [ "$2" == "" ];then echo "Usage: $0 <contentDir (from lib/samples)> <resolution> "; exit 1 ; fi

#### Which has the following var
#Determine where we will save in $resultroot
export ds=gia-young-picasso-v02b-201210-864
export modelname='model_'$ds'_new'
export modeltag=$modelname
export ftag=pkw_v02b$2x$1
export savedirnamespace=${ds//"gia-ds-"/}

#where is mounted the s3 disk
export tcloudroot=/home/jgi/astiapreviz

export container_arc=cpu

read -r -d '' _TORENDER << RENDERME
# /a/lib/samples/$1,$2;
RENDERME
# /a/lib/samples/contentslimmer,864;
#RENDERME
# /a/lib/samples/contentslimmer,2332;
#RENDERME
# /a/lib/samples/contentslimmer,1333;
# SAVEDIRBASE/1333x,2333
# /a/lib/samples/contentslimmer,2332;
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
