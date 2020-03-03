FROM ruby:2.6.1-alpine

# Install pre-requisites for building nokogiri & pg gems
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .

RUN chown -R appuser:appgroup /app/tmp
RUN chown -R appuser:appgroup /app/log
RUN chown -R appuser:appgroup /app/db

USER 1000

CMD ["rails", "server", "-b", "0.0.0.0"]
