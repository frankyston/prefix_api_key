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
    [salt_short, salt_long, password_short, password_long].none?(&:nil?)
  end
end
