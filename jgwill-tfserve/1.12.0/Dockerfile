FROM jgwill/gix-adaptive-style-transfer:prod-cpu
# Install TF Serve for this version of TF

WORKDIR /install
# Install the TensorFlow Model Serving Package
RUN echo "deb http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list && \
curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add -
RUN apt update
COPY install-tf-serving .

RUN apt-get install tensorflow-model-server -y


WORKDIR /server

# So we can run the clients
RUN pip install tensorflow-serving-api==1.12.0

COPY launch-tf-serve.sh .
COPY _env.sh .
RUN chmod a+x *sh
#add the env to the bashrc of the root
RUN cat _env.sh > /root/.bashrc

