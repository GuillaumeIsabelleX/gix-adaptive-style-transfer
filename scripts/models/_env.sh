#!/bin/bash


#@STCGoal Iteration of the Traiting
export iterationcontext=255000


#@STCGoal A model context is saved into a tar gzipped as local archives and published on the cloud filesystem
export modelsourcecontext=model_gia_style_AcrylicPaint2012_new
export modelcontext=model_giacrypaint201205

export tarcontext=$modelcontext-$iterationcontext.tar.gz
export publishroot=/Downloads__2012


echo "Model Source : $modelsourcecontext \
	 model Context (target): $modelcontext \
         into: $tarcontext \
         publishing it to: $publishroot"

