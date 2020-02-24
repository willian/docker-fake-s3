FROM alpine
MAINTAINER Willian Fernandes <me@willianfernandes.com>

RUN apk add --no-cache --update \
  ruby \
  ruby-io-console

ENV FAKES3_VERSION 2.0.0
RUN gem install fakes3 -v $FAKES3_VERSION --no-ri --no-rdoc

RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

EXPOSE 5353

WORKDIR /fakes3

CMD ["fakes3", "-r", "/fakes3", "-p", "5353"]
