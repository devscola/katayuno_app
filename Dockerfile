FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /myapp
ADD . /myapp

RUN gem install bundler
RUN bundle install
