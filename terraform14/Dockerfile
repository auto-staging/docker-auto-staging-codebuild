FROM ubuntu:20.04

ENV TERRAFORM_VERSION=0.14.9
ENV TERRASTATE_VERSION=1.8.0

RUN apt-get update && \
    #apt-get install curl jq python python-pip python3 python3-pip ca-certificates git openssl unzip wget make openssh-client -y --no-install-recommends && \
    apt-get install python3-pip curl jq ca-certificates git openssl unzip wget make openssh-client -y --no-install-recommends && \
    cd /tmp && \
    wget https://github.com/janritter/terrastate/releases/download/${TERRASTATE_VERSION}/linux_amd64_terrastate && mv linux_amd64_terrastate /usr/bin/terrastate && chmod +x /usr/bin/terrastate && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    pip3 install --upgrade wheel && \
    pip3 install --upgrade setuptools && \
    pip3 install --upgrade awscli && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/tmp/* && \
    mkdir -p /root/.ssh
