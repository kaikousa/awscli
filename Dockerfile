FROM ubuntu:18.04
MAINTAINER Kai Kousa <kai.kousa@gmail.com>

RUN apt-get update && apt-get install -y \
    python-setuptools \
    python-dev \
    python-pip \
    zip \
    unzip \
    git-core \
    curl \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install awscli s3cmd awsebcli boto3

COPY bin/* /usr/bin/
