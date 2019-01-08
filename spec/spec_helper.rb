ENV["RACK_ENV"] ||= 'test'

require 'capybara/rspec'
require 'database_cleaner'

require './app'
require './spec/support/database_cleaner'

Capybara.app = UserAuth
