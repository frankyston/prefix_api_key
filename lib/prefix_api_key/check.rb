# frozen_string_literal: true

require 'base64'
require 'digest'

module PrefixApiKey
  class Check
    def self.call(token: nil, hash: nil)
      new.call(token:, hash:)
    end

    def call(token: nil, hash: nil)
      token = token.split('_')
      prefix = token[0]
      short_token = token[1]
      long_token = token[2]

      short_token_valid = short_token_valid(prefix:)

      digest_hash = ::Digest::SHA2.hexdigest(long_token)

      short_token_valid == short_token && hash == digest_hash
    end

    private

    def short_token_valid(prefix: nil)
      Base64.strict_encode64(prefix + salt_short + password_short)[0..6]
    end

    def salt_short
      PrefixApiKey.configuration.salt_short
    end

    def password_short
      PrefixApiKey.configuration.password_short
    end
  end
end
