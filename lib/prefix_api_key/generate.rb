require 'base64'
require 'securerandom'

module PrefixApiKey
  class Generate
    def self.call(prefix: "prefix")
      new.call(prefix: prefix)
    end

    def call(prefix: "prefix")
      short_token = Base64.strict_encode64(prefix + salt_short + password_short)[0..6]
      long_token = Base64.strict_encode64(salt_long + password_long + prefix)
      long_token_hash = SecureRandom.hex(30)
      token = "#{prefix}_#{short_token}_#{long_token}"

      {
        short_token: short_token,
        long_token: long_token,
        long_token_hash: long_token_hash,
        token: token,
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
  end
end
