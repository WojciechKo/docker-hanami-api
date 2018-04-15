require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/bikeramp'
require_relative '../apps/api/application'

Dir[File.join(__dir__, 'initializers', '*.rb')].each { |f| require f }

Hanami.configure do
  mount Api::Application, at: '/'

  model do
    adapter    :sql, ENV['DATABASE_URL']
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end
end
