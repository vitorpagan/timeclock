# BioID

[![wercker status](https://app.wercker.com/status/9db7bf642364ec37d81d2009c9cd137e/m "wercker status")](https://app.wercker.com/project/bykey/9db7bf642364ec37d81d2009c9cd137e)

## Ruby version

  * Please check the ``.ruby-version`` file for the exact version of Ruby to use

## System dependencies

  * Postgresql

## Configuration

  * Git clone repository
  * Copy configs .sample to .yml
  * bundle install
  * bower isnstall
  * rake db:create db:migrate
  * bundle exec rails s

## Seed data

  * rake db:seed
  * rake bioid:applications:register

## Tests

  * Dependencies: [PhantomJS](http://phantomjs.org/)
  * bundle exec rspec

## Mail Configuration:

Run the following exports:

    export GMAIL_DOMAIN="domain.url" 
    export GMAIL_USERNAME="username"
    export GMAIL_PASSWORD="password"

Where domain.url is your gmail domain, if you are using your bionexo account use "bionexo.com".