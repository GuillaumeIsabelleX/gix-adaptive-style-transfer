#### Which has the following var
#Determine where we will save in $resultroot
export savedirnamespace=gia-ds-pierret_ds_210512-864-v01-210517-864
#subdir of this render in the namespace above
export ftag=pt_v01
#The model store we will be using
export modeltag=model_gia-ds-pierret_ds_210512-864-v01-210517-864_new

##########################################
####### WHAT TO RENDER IS DEFINED HERE ##
# <Source content path> <resolution>
read -r -d '' TORENDER << KEEPMEHERE
/a/lib/samples/sc 600
/a/lib/datasets/SmallCreation 520
/a/lib/samples/content 576
KEEPMEHERE