#!/bin/bash



#@STCGoal A model context is saved into a tar gzipped as local archives and published on the cloud filesystem
#export modelsourcecontext=model_gia_style_AcrylicPaint2012_new
#export modelcontext=model_giacrypaint201205
#export iterationcontext=240000
#export tarcontext=$modelcontext-$iterationcontext.tar.gz
#export publishroot=/Downloads__2012

source _env.sh

echo "Archiving model: $modelcontext \
	\n into: $tarcontext \
		\t\t publishing it to: $publishroot"
export successmsg="Archived model: $modelcontext \
        \t into: $tarcontext \
                \t\t published it to: $publishroot"

(tar cvzf $tarcontext $modelcontext && droxul upload $tarcontext $publishroot && ginol -s "$successmsg") &
#echo "Processing started in BG"


##jgi@as:/a/model/models$ (export modelcontext=model_giacrypaint201205;export iterationcontext=240000; export tarcontext=$modelcontext-$iterationcontext.tar.gz;echo '(tar cvzf $tarcontext $modelcontext && droxul upload $tarcontext /Downloads__2012)')
