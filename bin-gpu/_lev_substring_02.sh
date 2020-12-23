#!/bin/bash
modelname=$1
replacerstr="model_"
secondString=""
echo "${modelname/model_model_/$secondString}"    
export modelname="${modelname/$replacerstr/$secondString}"
echo $modelname

# prints 'I love Sara and Marry'
