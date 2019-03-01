#!/bin/sh

rm /app/tmp/pids/server.pid
bundle exec rails db:setup
bundle exec rails runner "Dummy.create(message: 'This is the initial message')"
bundle exec rails server
