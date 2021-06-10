FROM jgwill/gix-adaptive-style-transfer:cpu

#FROM guillaumeai/ast:gpu-cpu-limitation-210516

#@STCGoal Droxul support

#RUN apt update && apt upgrade -y

#RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
#RUN bash nodesource_setup.sh
#RUN apt install nodejs -y
#RUN apt install npm -y
#RUN npm install droxul --g
#RUN node --version
#RUN npm --version
WORKDIR /
RUN rm -rf model
WORKDIR /model
RUN git clone https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer.git .


WORKDIR /root

COPY build/bashaliases .bash_aliases
COPY build/bashaliases /model/.bash_aliases

# RUN echo 'alias dx="drox -f /config/.dropbox_uploader "' >> .bashrc
# RUN echo 'alias dxup="drox -f /config/.dropbox_uploader upload "' >> .bashrc

WORKDIR /model
COPY build/*sh .

#RUN groupdel -f ubuntu
#RUN userdel --remove  ubuntu

ARG UNAME=jgi
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
RUN chown -R jgi.jgi /model

USER $UNAME

RUN git pull

