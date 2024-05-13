# frozen_string_literal: true

require 'base64'
require 'digest'

module PrefixApiKey
  class Generate
    def self.call(prefix: 'prefix')
      new.call(prefix: prefix)
    end

    def call(prefix: 'prefix')
      validate_configuration!
      {
        short_token: generate_short_token(prefix),
        long_token: generate_long_token(prefix),
        long_token_hash: generate_long_token_hash(prefix),
        token: generate_token(prefix),
        prefix: prefix
      }
    end

    private

    def salt_short
      PrefixApiKey.configuration.salt_short
    end

    def salt_long
      PrefixApiKey.configuration.salt_long
    end

    def password_short
      PrefixApiKey.configuration.password_short
    end

    def password_long
      PrefixApiKey.configuration.password_short
    end

    def generate_short_token(prefix)
      Base64.strict_encode64(prefix + salt_short + password_short)[0..6]
    end

    def generate_long_token(prefix)
      Base64.strict_encode64(salt_long + password_long + prefix)
    end

    def generate_long_token_hash(prefix)
      ::Digest::SHA2.hexdigest(generate_long_token(prefix))
    end

    def generate_token(prefix)
      "#{prefix}_#{generate_short_token(prefix)}_#{generate_long_token(prefix)}"
    end

    def validate_configuration!
      raise StandardError, 'Configuration is not set' unless PrefixApiKey.configuration.valid?
    end
  end
end
