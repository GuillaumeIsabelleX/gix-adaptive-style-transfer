#!/bin/bash

# train the model vo
## In case DS not updated
(cd /a/lib/datasets;git pull)


ds=gia-ds-viromunchkin-s01-v01




./run-gpu-train-bg-var2 $ds

