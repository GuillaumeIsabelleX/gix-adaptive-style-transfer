#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-ds-Inktobers-v01-210611-864x



./run-gpu-train-bg-more-chk-higher-res $ds
#./run-gpu-train-bg-more-chk $ds
#./run-gpu-train-bg $ds
#./run-gpu-train-bg-var2 $ds
#./run-cpu-train-bg $ds

