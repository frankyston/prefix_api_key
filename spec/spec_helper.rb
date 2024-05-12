# frozen_string_literal: true

require 'prefix_api_key'
require 'pry'

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
    config.salt_short = 'salt_short'
    config.salt_long = 'salt_long'
    config.password_short = 'password_short'
    config.password_long = 'password_long'
  end
end
