require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/bikeramp'
require_relative '../apps/api/application'

Hanami.configure do
  mount Api::Application, at: '/'

  model do
    adapter :sql, ENV['DATABASE_URL']
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  logger level: ENV.fetch('LOGGER_LEVEL')

  environment :test do
    logger level: ENV.fetch('LOGGER_LEVEL'), stream: "logs/test.log"
  end
end
