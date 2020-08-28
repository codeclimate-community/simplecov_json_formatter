FROM ruby:2.5

WORKDIR /gem

COPY . .

RUN apt-get update -y && \
    gem install bundler:2.1.0 && \
    bundle install
