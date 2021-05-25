#!/bin/bash

#@STCgoal Render PNG (highest quality than JPG)  
#@a This makes a model to render locally in a container

 cd /wmodel/ && \
     mkdir /m && \
     tar cf - * | (cd /m; tar xf -) && \
     cd /m && \
     mv models models.old && \
     ln -sf /model/models ./models && \
     mv model.py model_jpg.py && \
     mv model_png.py model.py && \
     echo "All set for infering PNG" && \
     ./inference.sh

