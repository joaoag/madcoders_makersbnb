ENV['RACK_ENV'] ||= 'test'

require 'capybara/rspec'
require 'database_cleaner'
require './spec/features/web_helpers.rb'
require './app'
require './spec/support/database_cleaner'
require 'simplecov'
require 'simplecov-console'

Capybara.app = MakersBnb

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start
