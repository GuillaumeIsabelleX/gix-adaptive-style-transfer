#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-ds-fpolsonwill_v02_210424




#./run-gpu-train-bg-var2 $ds
./run-gpu-train-bg $ds

