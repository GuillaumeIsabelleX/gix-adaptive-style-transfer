#!/bin/bash

docker images | awk '/'$1'/ { print $3" "$7" "$1":"$2 }'
