# frozen_string_literal: true

require_relative 'prefix_api_key/version'
require 'prefix_api_key/configuration'
require 'prefix_api_key/generate'
require 'prefix_api_key/check'

module PrefixApiKey
  class Error < StandardError; end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
