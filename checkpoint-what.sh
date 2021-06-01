#!/bin/bash

# shows checkpoints of the current models

du -a models/ | grep data | awk '// { print $2 }'


