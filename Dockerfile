FROM ruby:2.5.0

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN mkdir /twichie
WORKDIR /twichie
COPY Gemfile /twichie/Gemfile
COPY Gemfile.lock /twichie/Gemfile.lock
RUN bundle install

ADD package.json /twichie/package.json
ADD yarn.lock /twichie/yarn.lock
RUN yarn install

COPY . /twichie
