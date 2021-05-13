#!/bin/bash

# train the model vo
## In case DS not updated
ping as && (cd /a/lib/datasets;git pull) || echo "Dataset were not updated, it might be ok"



ds=gia-ds-DavidBouchardGagnon-v01a-210510




#./run-gpu-train-bg $ds
#./run-gpu-train-bg-var2 $ds
./run-cpu-train-bg $ds

