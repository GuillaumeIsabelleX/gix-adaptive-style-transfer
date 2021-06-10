FROM guillaumeai/server:ast-2103220014
ARG MODEL_TO_COPY
#ast-210420
#FROM guillaumeai/ast:gpu-cpu-limitation-210421
#@STCGoal An API server container on dockerhub that you pull and can start with a model included in it.

WORKDIR /data/styleCheckpoint/$MODEL_TO_COPY
COPY build/models/$MODEL_TO_COPY .
WORKDIR /guillaumeai
COPY build-docker.sh .
COPY run-docker-test.sh .
COPY Dockerfile .
COPY list_to_dockerize.txt .
COPY batch-build-to-dockerize.sh .
COPY all_dockerized_model_list.txt .
WORKDIR /model

#ENTRYPOINT []