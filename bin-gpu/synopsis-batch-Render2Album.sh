#!/bin/bash
#@STCGoal An album montage is created and published from render in the cloud, an address is received for the Album along with a Contact sheet URL image
if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
fi
export LOG_FILE=/var/log/gia/result_To_Montage_Pipeline-To_cloudNotified.sh.txt
export LOG_ENABLED=y
log_info "Starting $0"


executer=./doit.sh-cpu
renderbatch=_render_env_gia-young-picasso-v02b-201210-864.sh-batch
chks="150 165 180 195 210 225 240 255 270 285 15 30 45 60 75 90 105 120 135"
renderToMnotageToPipelineEndingByCloudPublished=$binroot/result_To_Montage_Pipeline-To_cloudNotified.sh

. _render_env_gia-young-picasso-v02b-201210-864.sh-batch 
export ds=gia-young-picasso-v02b-201210-864
export modelname='model_'$ds'_new'
export modeltag=$modelname
export ftag=pkw_v02b864
export savedirnamespace=${ds//"gia-ds-"/}
export savefulldir=$libroot/results/$savedirnamespace/$ftag
lvar ds modelname modeltag ftag savedirnamespace savefulldir
exit
#@a Rendering is completed, \
	#@a then a contact sheet is generated and published with a URL as notification \
	#@a then separated into content \
	#@a then a Montage with content and original \
	#@a then made into an album
	#@a then published to the cloud
	#@a then an address is generated and send as notification thru email
log_status "Rendering" STARTING && \
	$executer $renderbatch $chks && \
	log_status "Rendering" COMPLETED && \
	cd $savefulldir && \
	log_info "Now in $savefulldir" && \
	$renderToMnotageToPipelineEndingByCloudPublished && \
	log_status "renderToMnotageToPipelineEndingByCloudPublished" COMPLETED || \
	log_status "renderToMnotageToPipelineEndingByCloudPublished" FAILED

#@a Publish pass to ADAPT
#tar cf - _montage-dbg_v01b2_by_content__315k__gal | (cd /home/jgi/astiapreviz/; tar xf -; ./_getaddress.sh _montage-dbg_v01b2_by_content__315k__gal --sns)



