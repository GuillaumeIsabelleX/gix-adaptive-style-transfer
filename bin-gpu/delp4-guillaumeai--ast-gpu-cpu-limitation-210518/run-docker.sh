#!/bin/bash

source _env.sh

docker run -it --rm -v $(pwd):/work $containertag 


