#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-ds-DavidBouchardGagnon-v01a-210510




#./run-gpu-train-bg-var2 $ds
./run-cpu-train-bg $ds

