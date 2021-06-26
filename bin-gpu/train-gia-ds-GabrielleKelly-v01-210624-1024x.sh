#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-ds-GabrielleKelly-v01-210624-1024x


# CHOOSE THE DESIRED TRAINER

./run-gpu-train-bg-more-chk-higher-res-928x $ds  #Train in 928x

#./run-gpu-train-bg-more-chk-higher-res $ds    #Train in 864x
#./run-gpu-train-bg-more-chk $ds	       #Train regular but more checkpoints
#./run-gpu-train-bg $ds
#./run-gpu-train-bg-var2 $ds
#./run-cpu-train-bg $ds

