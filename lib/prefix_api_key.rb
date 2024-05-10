# frozen_string_literal: true

require_relative "prefix_api_key/version"

module PrefixApiKey
  class Error < StandardError; end

  class Hello
    def say!
      puts 'hello'
    end
  end
end
