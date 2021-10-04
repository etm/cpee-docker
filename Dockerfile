FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
ruby \
build-essential \
ruby-dev \
libxml2-dev \
libxslt-dev \
libz-dev \
libssl-dev \
librasqal-dev \
libraptor2-dev \
libicu-dev \
redis \
vim \
curl \
&& rm -rf /var/lib/apt/lists/*
RUN gem install cpee
RUN gem install cpee-logging-xes-yaml
RUN gem install cpee-instantiation
RUN cd /run;cpee new flow
RUN cd /run;cpee-instantiation inst
RUN cd /run;cpee-logging-xes-yaml new log

CMD ["/bin/bash"]
