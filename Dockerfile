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
RUN pip install awscli s3cmd awsebcli boto3 jinja2

# add nodejs repository
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs

# install yarn to replace npm
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN npm install -g serverless typescript

COPY bin/* /usr/bin/
