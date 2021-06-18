#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-young-picasso-v03-201216



./run-gpu-train-bg-more-chk-higher-res $ds
#./run-gpu-train-bg-more-chk $ds
#./run-gpu-train-bg $ds
#./run-gpu-train-bg-var2 $ds
#./run-cpu-train-bg $ds

