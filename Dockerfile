FROM ubuntu:18.04
MAINTAINER Kai Kousa <kai.kousa@gmail.com>

RUN apt-get update && apt-get install -y \
    python-setuptools \
    python-dev \
    python3-pip \
    zip \
    unzip \
    git-core \
    curl \
    jq \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install awscli s3cmd awsebcli boto3 jinja2

RUN curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy | tee /usr/bin/ecs-deploy \
    && chmod +x /usr/bin/ecs-deploy

# add nodejs repository
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs

# install yarn to replace npm
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN npm install -g serverless typescript

COPY bin/* /usr/bin/
