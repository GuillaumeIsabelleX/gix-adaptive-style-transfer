#!/bin/bash
# This dockerize a list of GIAAST models to Docker
# by Guillaume Descoteaux-Isabelle,2021
###############################################
export list_to_dockerize=list_to_dockerize.txt
export modelroot=/a/model/models
export wrkdir=/d/gia-model-dockerizing-2104

#cleaning and making  build folder
modelbuildsubdir=build/models
(cd $wrkdir;rm -rf build;mkdir -p $modelbuildsubdir)
export buildmodelroot=$wrkdir/$modelbuildsubdir

for m in $(cat $list_to_dockerize)
do
   echo "----------------------$m-------------------------"
   echo "---------Echo Building $m "
   echo "--Caching model in build folder ..."
   (cd $modelroot; tar cf - $m | (cd $buildmodelroot ; tar xvf -))
   modelcachedir=$buildmodelroot/$m
   echo "--Model cached done to: $modelcachedir"
   echo "--Building Docker container and pushing"
   ./build-docker.sh $m && echo "Model $m Built Successfully" || echo "Model $m FAILED to build and push"
   echo "-------------------------"
   echo "-- Cleaning up $modelcachedir ---"
   rm -rf $modelcachedir
   echo "-----------------------------------"
   echo "---------------------------------------------"
done
