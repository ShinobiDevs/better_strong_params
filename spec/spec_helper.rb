require 'bundler/setup'
Bundler.setup

require 'active_model'
require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'better_strong_params' # and any other gems you need

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end
