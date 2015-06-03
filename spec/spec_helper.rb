require 'bundler/setup'
Bundler.setup

require 'nth_day'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # Enable both expect() and .should syntax
    expectations.syntax = [:should, :expect]
  end
end