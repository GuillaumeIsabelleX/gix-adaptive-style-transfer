#!/bin/bash


if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
else 
	echo "Could not load functions..."
	exit 1
fi


export LOG_ENABLED=y
DEBUG=0
log_info "Starting $0"
log_status "$renderbatch" CONFIG
log_status "$ds" DS
log_status "$ftag" FTAG

executer=./doit.sh-cpu

renderToMnotageToPipelineEndingByCloudPublished="$binroot/result_To_Montage_Pipeline-To_cloudNotified.sh"
#csmForeachFolderInCurrent="$binroot/_csm_foreach_dir_in_current.sh"
csmForeachFolderInCurrent="$binroot/_csm_foreach_dir_in_current_As_Label.sh"
export tcloudroot=/home/jgi/astiapreviz

export tcloudgetaddress=/home/jgi/astiapreviz/_getaddress.sh


log_status "$modeltag" MODELTAG

export tclouddir=$tcloudroot/$ftag
mkdir -p $tclouddir
#export savedirnamespace=${ds//"gia-ds-"/}
export savefulldir=$libroot/results/$savedirnamespace/$ftag

dvar ds modelname modeltag ftag savedirnamespace savefulldir
cloudit() {
	local f="$1"
	(cp $f $tclouddir && \
		cd $tcloudroot && \
		$tcloudgetaddress $ftag/$f --sns && echo "done adding $f to $tclouddir")

}
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
	log_status "ContactSheetMaking" STARTING && \
	(($csmForeachFolderInCurrent  && sleep 20 && for csm in _*csm*jpg ; do cloudit $csm;done ) &) && \
	sleep 1 && \
	log "-------------------------------------------" && \
	log_info "Entering $renderToMnotageToPipelineEndingByCloudPublished" && \
	(cd $savefulldir && pwd && $renderToMnotageToPipelineEndingByCloudPublished) && \
	log_status "renderToMnotageToPipelineEndingByCloudPublished" COMPLETED || \
	log_status "renderToMnotageToPipelineEndingByCloudPublished" FAILED
#$tclouddir $tcloudgetaddress
#@a Publish pass to ADAPT
#tar cf - _montage-dbg_v01b2_by_content__315k__gal | (cd /home/jgi/astiapreviz/; tar xf -; ./_getaddress.sh _montage-dbg_v01b2_by_content__315k__gal --sns)




