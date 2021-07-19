#!/bin/bash

export cp=$1

# USAGE: this.sh /a/lib/samples/sketches__2101101257_rcc 1024 "_1k"

export ir=$2

export fk="$3"


export sc=/work/fori.sh

# Represents the models naming for simpler use in command wrapper
export ast03=model_gia-young-picasso-v03-201216_new
export ast04=model_gia-young-picasso-v04-2012211928_new
export ast05=model_gia-young-picasso-v05-2101082232_new

$sc $ir $fk _v03 $ast03 $cp
$sc $ir $fk _v04 $ast04 $cp
$sc $ir $fk _v05 $ast05 $cp


