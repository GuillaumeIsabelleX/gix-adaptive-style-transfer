#!/bin/bash
# Migrate to repo
export dist=/c/usr/src/gix-adaptive-style-transfer/bin/


# logs of inferences
cp history-inference-2012101132.txt $dist

# CURRENT Inference Script used (see in history)
cp inference.sh $dist
cp _env.sh $dist

cp _env.sh $dist
cp inference.sh $dist


cp _setmodel.sh $dist
cp _setmodel2.sh $dist


cp _train_sample.sh $dist

cp build.sh $dist
cp Dockerfile $dist
cp cpu-run-gpu-train-bg $dist

# Run a container with the Cezanne Model for infering
cp cezanne.sh $dist

# deploy picassojgwill201208
cp depl-picassojgwill_201208.sh $dist
cp i-picassojgwill_201208.sh $dist

# Build the Env for running the inferencing

# adapt and use to connect to the container when training mostly
cp exec.sh $dist

#DEPRECATING
cp giacrypaint201205.sh $dist

# A new Inference Script I have not tested
cp inference2.sh $dist

# ?
cp init-mount.sh $dist

cp migrating.sh $dist
cp README.md $dist

cp run-gpu $dist
cp run-gpu-train-bg $dist



cp trainer.sh $dist
cp train-pablo-picasso-jgwill-select-2012.sh $dist



cp sample-inference-gia-young-picasso-201209.sh $dist





cp ws__FIXING.code-workspace $dist

cp ws__GAIA_Ubuntu__Deployment_of_AI_Model__2012081511.code-workspace $dist
