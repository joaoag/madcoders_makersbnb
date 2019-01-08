ENV['RACK_ENV'] ||= 'development'

require './lib/user'

DataMapper.setup(:default, "postgres://localhost/user_auth_#{ENV["RACK_ENV"]}")

DataMapper.finalize
