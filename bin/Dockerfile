#FROM jgwill/ai-tf:1.12.0
FROM guillaumeai/tf:1.12.0-cpu

RUN apt update 
RUN apt install dos2unix -y

WORKDIR /model
RUN ls

RUN git clone https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git . && git checkout prod && rm -rf /model/.git && du -ksh /model
RUN dos2unix *

# We will link to /a/model/models
RUN rm -rf models



#COPY _train_sample.sh .
#COPY _env.sh .
#COPY datasettrain.sh .
COPY . .

RUN dos2unix *

RUN chmod 775 *sh

RUN echo "docker run -it --rm -v /a/lib:/a/lib -v /a/model/models:/model/models -v $(pwd):/work -v /a/model:/a/model jgwill/gix-adaptive-style-transfer:prod-cpu"
