#Docker image with aws-cli for copying PCF backup files
FROM alpine:3.5
RUN apk update
RUN apk add bash wget curl jq
RUN apk add openssh

RUN apk --update add ruby ruby-dev gcc make g++ musl-dev
RUN gem install bosh_cli --no-ri --no-rdoc
RUN gem install json --no-ri --no-rdoc
#RUN gem install cf-uaac --no-ri --no-rdoc

COPY om-alpine om-alpine
COPY bosh bosh

# get terraform
RUN wget https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip
RUN unzip terraform_0.10.8_linux_amd64.zip
RUN chmod a+x terraform
RUN ln terraform /usr/local/bin/terraform

COPY pcf_diag.pl pcf_diag.pl

RUN mkdir -p /aws
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN pip install --upgrade pip
RUN pip install tile-generator
RUN pip install s3cmd
RUN apk add openssl

RUN apk add perl
RUN apk add perl-json

#RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
