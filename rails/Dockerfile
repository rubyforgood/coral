from ruby:2.6.3-alpine

RUN set -ex && \
    apk add --update build-base yarn nodejs postgresql-dev tzdata && \
    apk upgrade && \
    rm -rf /var/cache/apk

# preinstall gems that take forever to load, because no-one has time for this
RUN gem install bundler bcrypt ffi nokogiri pg sassc rb-inotify nio4r bootsnap byebug puma

WORKDIR /srv/coral

COPY Gemfile* yarn* package*.json /srv/coral/

RUN bundle install --system
RUN yarn install --check-files

COPY . /srv/coral

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
