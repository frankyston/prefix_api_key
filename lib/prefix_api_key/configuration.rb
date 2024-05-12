# frozen_string_literal: true

class Configuration
  attr_accessor :salt_short, :salt_long, :password_short, :password_long

  def initialize
    @salt_short = ENV.fetch('SALT_SHORT', nil)
    @salt_long = ENV.fetch('SALT_LONG', nil)
    @password_short = ENV.fetch('PASSWORD_SHORT', nil)
    @password_long = ENV.fetch('PASSWORD_LONG', nil)
  end

  def valid?
    if @salt_short.nil? || @salt_long.nil? || @password_short.nil? || @password_long.nil?
      raise StandardError,
            'Missing configuration environment'
    end

    true
  end
end
