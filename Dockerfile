FROM jgwill/ai-tf:1.12.0


RUN git clone https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git /model


WORKDIR /model

#COPY _train_sample.sh .
#COPY _env.sh .
#COPY datasettrain.sh .
COPY . .

RUN chmod 775 *sh

RUN echo "nvidia-docker run -it --rm -v /a/lib:/a/lib jgwill/IMGNAME"
