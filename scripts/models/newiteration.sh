
source _env.sh

mkdir -p $modelcontext
mkdir -p $modelcontext/checkpoint_long

# Enable supplying the current iteration from first argument otherwise use the one def in the _env
if [ -z "$1" ]
  then
    echo "Using Iteration from ENV"
    else
        echo "setting iteration to the given arugment"
        export iterationcontext=$1


fi
echo "current iteration is : $iterationcontext"


# Clean old version (we keep it low in space)
rm $modelcontext/checkpoint_long/*
#echo "rm $modelcontext/checkpoint_long/*"
cp $modelsourcecontext/checkpoint_long/*$iterationcontext* $modelcontext/checkpoint_long/
#echo "cp $modelsourcecontext/checkpoint_long/*$iterationcontext* $modelcontext/checkpoint_long/"


#cp $modelsourcecontext/checkpoint_long/checkpoint $modelcontext/checkpoint_long/
#vi $modelcontext/checkpoint_long/checkpoint
echo "model_checkpoint_path: \"$modelsourcecontext"_"$iterationcontext.ckpt-$iterationcontext\"" >$modelcontext/checkpoint_long/checkpoint
echo "all_model_checkpoint_paths: \"$modelsourcecontext"_"$iterationcontext.ckpt-$iterationcontext\"" >> $modelcontext/checkpoint_long/checkpoint
cat "$modelcontext/checkpoint_long/checkpoint"

echo "all should be done"
echo "see in : ls $modelcontext/checkpoint_long/"
echo "@STCStatus : Ready to Tar and publish"
echo "@STCStatus: For inference"
