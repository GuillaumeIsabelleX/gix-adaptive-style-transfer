FROM jgwill/gix-adaptive-style-transfer:gpu

WORKDIR /model

RUN sed -i 's/container_arc=gpu/container_arc=cpu/' _env.sh

RUN bash _env.sh && echo $container_arc && sleep 3
