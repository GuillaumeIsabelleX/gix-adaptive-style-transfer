FROM jgwill/gix-adaptive-style-transfer:gpu

WORKDIR /
RUN rm -rf model
RUN git clone https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git /model
WORKDIR /model
RUN git fetch --all && git checkout -b feat-cli-container-210110 origin/feat-cli-container-210110 

RUN git pull

RUN sed -i 's/container_arc=gpu/container_arc=cpu/' _env.sh
RUN apt update && apt install dos2unix -y
RUN cp bin-gpu/trainer-cpu.sh .
RUN dos2unix *sh

#RUN du -ksh .git && rm -rf .git
RUN bash _env.sh && echo $container_arc && sleep 3


