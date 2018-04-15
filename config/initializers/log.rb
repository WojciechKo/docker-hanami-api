level        = ENV.fetch("LOGGER_LEVEL")
environment  = ENV.fetch("RACK_ENV")

stream = if environment == 'test'
           "logs/test.log"
         else
           $stdout
         end

LOG = Logger.new(stream, level: level)
