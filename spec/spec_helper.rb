# frozen_string_literal: true

require 'prefix_api_key'
require 'dotenv'
require 'webmock'
require 'pry'

Dotenv.load('.env.test')
Dotenv.load('.env.test.local')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def set_configuration
  PrefixApiKey.configure do |config|
    config.salt_short = ENV['SALT_SHORT']
    config.salt_long = ENV['SALT_LONG']
    config.password_short = ENV['PASSWORD_SHORT']
    config.password_long = ENV['PASSWORD_LONG']
  end
end
