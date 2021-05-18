#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-ds-pierret_ds_210512-864-v01-210517-864




./run-gpu-train-bg $ds
#./run-gpu-train-bg-var2 $ds
#./run-cpu-train-bg $ds

