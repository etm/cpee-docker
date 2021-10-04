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
nginx \
&& rm -rf /var/lib/apt/lists/*
RUN gem install cpee
RUN gem install cpee-logging-xes-yaml
RUN gem install cpee-instantiation
RUN cd /run;cpee new flow
RUN cd /run;cpee-instantiation start
RUN cd /run;cpee-logging-xes-yaml new log
RUN cd /run;cpee cpui cpee-ui
RUN cd /var/www;ln -s /run/log/logs
RUN cd /var/www;ln -s /run/cpee-ui flow
RUN cd /var/www;ln -s /run/cpee-ui/js_libs js_libs
RUN cd /var/www;curl https://raw.githubusercontent.com/etm/cpee-docker/main/index.html > index.html
RUN cd /var/www/flow;curl https://raw.githubusercontent.com/etm/cpee-docker/main/config.json > config.json
RUN cd /etc/nginx/sites-available/;curl https://raw.githubusercontent.com/etm/cpee-docker/main/nginx/localhost.conf > default
# RUN service nginx start

CMD ["/bin/bash"]
