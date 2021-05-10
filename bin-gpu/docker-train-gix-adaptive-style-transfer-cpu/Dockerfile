FROM jgwill/gix-adaptive-style-transfer:gpu

WORKDIR /
RUN rm -rf model
RUN git clone https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git /model
WORKDIR /model
RUN git fetch --all && git checkout -b feat-cli-container-210110 origin/feat-cli-container-210110 

RUN git pull
RUN du -ksh .git && rm -rf .git

RUN sed -i 's/container_arc=gpu/container_arc=cpu/' _env.sh

RUN bash _env.sh && echo $container_arc && sleep 3


