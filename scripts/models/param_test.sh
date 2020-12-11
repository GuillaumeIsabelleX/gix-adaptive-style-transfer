#!/bin/bash

source _env.sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
fi

if [ -z "$1" ]
  then
    echo "No argument supplied"
    else 
	    echo "setting iteration to the arugment"
	export iterationcontext=$1


fi
echo "current iteration is : $iterationcontext"

