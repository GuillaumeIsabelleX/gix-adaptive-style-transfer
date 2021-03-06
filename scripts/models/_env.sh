#!/bin/bash


#@STCGoal Iteration of the Traiting
#@Action Edit to the iteration to publish
export iterationcontext=270000


#@STCGoal A model context is saved into a tar gzipped as local archives and published on the cloud filesystem
export modelsourcecontext=model_gia-young-picasso-v03-201216_new
#export modelcontext=model_giacrypaint201205
export modelcontext=model_giapicallo_v03__201216

export tarcontext=$modelcontext-$iterationcontext.tar.gz
export publishroot=/Downloads__2012


echo "Model Source : $modelsourcecontext \
	 model Context (target): $modelcontext \
         into: $tarcontext \
         publishing it to: $publishroot"

