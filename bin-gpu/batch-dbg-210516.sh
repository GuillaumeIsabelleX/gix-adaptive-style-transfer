#!/bin/bash

sdir=/work
sfile=render-gia-ds-DavidBouchardGagnon-v01b-210510-864.sh
s=$sdir/$sfile

chp="$1"
c=/a/lib/samples/sketch_redraw_2103
r=1536
$s $chp $c $r
r=2200
$s $chp $c $r

c=/a/lib/samples/pierre
r=1536

$s $chp $c $r