FROM python:3.10-slim-buster 

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y wget python3 python3-pip

RUN pip3 install --upgrade pip wheel

####### prepare NODE NVM SETUP
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION lts/hydrogen

RUN mkdir -p $NVM_DIR

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# see https://github.com/nvm-sh/nvm
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install node and npm LTS
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION 
#######

####### add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
#######

COPY --link . /gpt-code-ui
WORKDIR /gpt-code-ui

# prereqs for gpt-code-ui
RUN apt install -y rsync socat

RUN source $NVM_DIR/nvm.sh && make build

RUN python3 setup.py install

EXPOSE 8080
ENV APP_HOST=

ENTRYPOINT socat TCP-LISTEN:8080,fork,bind=${APP_HOST} TCP:127.0.0.1:8080 & gptcode


