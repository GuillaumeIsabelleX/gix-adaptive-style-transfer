for d in *; do cdir=$(pwd);if [ -d "$d" ] ; then cd "$d"; for f in * ; do ff=${f%.*};echo $ff >> ../_all.txt;done; cd $cdir;fi ; done 
