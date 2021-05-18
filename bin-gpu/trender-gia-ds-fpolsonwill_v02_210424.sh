#!/bin/bash

chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
chks_long_all="60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
s="/work/render-gia-ds-fpolsonwill_v02_210424.sh" 
fullsleep="sleep 10000"



for c in $chks_long_all
do
	$s $c
	echo "Waiting for the next iteration (would be great to do that by looking the model dir)"
	$fullsleep
done

