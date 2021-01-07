FROM ruby:2.6.5

# WORKDIR /calendar
# COPY Gemfile /calendar/Gemfile
# COPY Gemfile.lock /calendar/Gemfile.lock
#
# RUN set -x && \
#     apt-get -qq update && \
#     apt-get -qq upgrade -y && \
#     apt-get -qq install -y build-essential && \
#     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#     apt-get -qq update && apt-get -y install yarn && \
#     echo 'gem: --no-rdoc --no-ri' > ~/.gemrc && \
#     echo bundle install -j4
#
# COPY . /calendar

WORKDIR /calendar
COPY Gemfile /calendar/Gemfile
COPY Gemfile.lock /calendar/Gemfile.lock

RUN set -x && \
    apt-get -qq update && \
    apt-get -qq upgrade -y && \
    apt-get -qq install -y build-essential && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -qq update && apt-get -y install yarn && \
    echo 'gem: --no-rdoc --no-ri' > ~/.gemrc && \
    gem install bundler && \
    bundle config set path 'vendor/bundle' && \
    bundle install -j4

COPY . /calendar

# RUN rails webpacker:install
# rails webpacker:install:vue
# gem install rails && rails new . -d mysql
