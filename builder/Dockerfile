# We use multi stage builds
FROM node:12-stretch-slim AS build

ARG REPO=https://github.com/xwiki-labs/cryptpad.git
ARG BRANCH=master

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq jq git
RUN npm install -g bower

RUN mkdir /cryptpad
WORKDIR /cryptpad

RUN git clone --depth 1 --branch ${BRANCH} --single-branch ${REPO} .\
    && rm -rf .git

RUN npm install --production \
    && npm install -g bower \
    && bower install --allow-root
