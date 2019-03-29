FROM ubuntu:18.04

ENV TERRAFORM_VERSION=0.11.13

RUN apt-get update && \
    apt-get install curl jq python python-pip ca-certificates git openssl unzip wget make -y --no-install-recommends && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    pip install --upgrade wheel && \
    pip install --upgrade setuptools && \
    pip install --upgrade awscli && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/tmp/* && \
    mkdir -p /root/.ssh
