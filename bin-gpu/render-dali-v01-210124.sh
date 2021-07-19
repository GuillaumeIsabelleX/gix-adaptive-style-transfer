#!/bin/bash
export savedirnamespace=daliv1-2101240443

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
#export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180"
#export partial_210108="15 30 45 60 75 90"
export partial_210108="15 30 45 60 75 90 105 120 135 150 1165 180 195"
export partial_210108="195 210 225 240 255 270 285 300"
export partial_210108="195 210 225 240 255"

#iteration 2012270346 - IMG_0019 choosen
export chks=$chks_long_all
#export chks=$partial_210108


export vtag=v01

export cp=$1

# USAGE: this.sh /a/lib/samples/sketches__2101101257_rcc 1024 "_1k"

export ir=$2

export fk="$3"


export sc=/work/fori.sh

# Represents the models naming for simpler use in command wrapper
export ast03=model_gia-young-picasso-v03-201216_new
export ast04=model_gia-young-picasso-v04-2012211928_new
export ast05=model_gia-young-picasso-v05-2101082232_new
export dali01=model_gia-ds-daliwill-210123-v01_new

#$sc $ir $fk _v03 $ast03 $cp
#$sc $ir $fk _v04 $ast04 $cp
#$sc $ir $fk _v05 $ast05 $cp
$sc $ir $fk $vtag $dali01 $cp


