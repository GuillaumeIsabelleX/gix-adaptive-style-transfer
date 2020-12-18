FROM jgwill/ai-tf:1.12.0-cpu

#RUN git clone --single-branch --branch feat__2012181051__switch https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git /model
RUN git clone https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git /model

RUN apt install dos2unix -y

WORKDIR /model

#COPY _train_sample.sh .
#COPY _env.sh .
#COPY datasettrain.sh .

#RUN ls
COPY . .
# We Mount the local folder with all models in that path (/model/models
RUN rm -rf models

#COPY /mnt/a/model/models/model_picassojgwill201208 models

RUN chmod 775 *sh
RUN dos2unix *
RUN dos2unix */*

RUN echo "nvidia-docker run -it --rm -v /a/lib:/a/lib jgwill/IMGNAME"
