from ruby:2.6.3-alpine

RUN set -ex && \
    apk add --update build-base yarn nodejs postgresql-dev tzdata && \
    apk upgrade && \
    rm -rf /var/cache/apk

# preinstall gems that take forever to load, because no-one has time for this
RUN gem install bundler \
      bcrypt:3.1.13 \
      ffi:1.11.1 \
      nokogiri:1.10.4 \
      pg:1.1.4 \
      sassc:2.2.0 \
      rb-inotify:0.10.0 \
      nio4r:2.5.1 \
      bootsnap:1.4.5 \
      byebug:11.0.1 \
      puma:3.12.1

WORKDIR /srv/coral

COPY Gemfile* yarn* package*.json /srv/coral/

RUN bundle install --system
RUN yarn install --check-files

COPY . /srv/coral

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
