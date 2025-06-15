FROM ruby:3.3.0

RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get install -y nodejs libpq-dev
RUN npm install --global yarn
RUN gem update --system 3.3.22

WORKDIR /myapp

COPY Gemfile* /myapp/

RUN bundle install