FROM ubuntu:20.04
MAINTAINER axboy

EXPOSE 8444 8447
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y curl jq python3 ansible tar bash ca-certificates git openssl unzip wget python3-pip sudo acl build-essential python3-dev python3.8-venv python3.8-distutils apt nfs-common python-is-python3 vim

ENV network="mainnet"
ENV plots_dir="/mnt"

ENV sleep_time=0

ENV node="false"
ENV farmer="false"
ENV harvester="false"
ENV plot="false"
ENV farmer_address="null"
ENV farmer_port="null"

ENV plot_k="32"
ENV plot_n="1"
ENV plot_b="4608"
ENV plot_f="null"
ENV plot_p="null"
ENV plot_a="null"
ENV plot_t="/mnt/tmp"
ENV plot_2="/mnt/tmp"
ENV plot_d="/mnt/output"
ENV plot_r="2"
ENV plot_u="128"

ARG TAG="1.2.3"
RUN echo "cloning ${TAG}"
RUN git clone --branch ${TAG} https://github.com/Chia-Network/chia-blockchain.git \
    && cd chia-blockchain \
    && git submodule update --init mozilla-ca \
    && /usr/bin/sh ./install.sh \
    && export CHIA_ROOT="~/.chia/mainnet"

WORKDIR /chia-blockchain
RUN mkdir /plots
ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]