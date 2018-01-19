FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /twichie
WORKDIR /twichie
COPY Gemfile /twichie/Gemfile
COPY Gemfile.lock /twichie/Gemfile.lock
RUN bundle install
COPY . /twichie
