#FROM jgwill/gix-adaptive-style-transfer:gpu

FROM guillaumeai/ast:gpu-cpu-limitation-210421

#@STCGoal Droxul support

RUN apt update && apt upgrade -y

#RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
#RUN bash nodesource_setup.sh
RUN apt install nodejs -y
RUN apt install npm -y
RUN npm install droxul --g
#RUN node --version
#RUN npm --version
WORKDIR /root

COPY build/bashaliases .bash_aliases

# RUN echo 'alias dx="drox -f /config/.dropbox_uploader "' >> .bashrc
# RUN echo 'alias dxup="drox -f /config/.dropbox_uploader upload "' >> .bashrc

WORKDIR /model
COPY build/*sh .
