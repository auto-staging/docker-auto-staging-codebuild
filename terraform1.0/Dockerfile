FROM ubuntu:20.04

ENV TERRAFORM_VERSION=1.0.11
ENV TERRASTATE_VERSION=1.10.0

RUN apt-get update && \
    apt-get install curl jq python-is-python3 python3-pip ca-certificates git openssl unzip wget make openssh-client -y --no-install-recommends && \
    cd /tmp && \
    wget https://github.com/janritter/terrastate/releases/download/${TERRASTATE_VERSION}/linux_amd64_terrastate && mv linux_amd64_terrastate /usr/bin/terrastate && chmod +x /usr/bin/terrastate && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    pip install --upgrade wheel && \
    pip install --upgrade setuptools && \
    pip install --upgrade awscli && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/tmp/* && \
    mkdir -p /root/.ssh
