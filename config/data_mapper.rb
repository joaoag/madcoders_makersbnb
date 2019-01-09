ENV['RACK_ENV'] ||= 'development'

require './lib/user'

DataMapper.setup(:default, "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")

DataMapper.finalize
