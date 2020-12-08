
source _env.sh

rm $modelcontext/checkpoint_long/*
cp $modelsourcecontext/checkpoint_long/*$iterationcontext* $modelcontext/checkpoint_long/

#cp $modelsourcecontext/checkpoint_long/checkpoint $modelcontext/checkpoint_long/
#vi $modelcontext/checkpoint_long/checkpoint
echo "model_checkpoint_path: \"$modelsourcecontext"_"$iterationcontext.ckpt-$iterationcontext\"" >$modelcontext/checkpoint_long/checkpoint
echo "all_model_checkpoint_paths: \"$modelsourcecontext"_"$iterationcontext.ckpt-$iterationcontext\"" >> $modelcontext/checkpoint_long/checkpoint
cat "$modelcontext/checkpoint_long/checkpoint"

echo "all should be done"
echo "see in : ls $modelcontext/checkpoint_long/"
echo "@STCStatus : Ready to Tar and publish"
echo "@STCStatus: For inference"
