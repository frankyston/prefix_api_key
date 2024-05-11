# frozen_string_literal: true

RSpec.describe Configuration do
  it "Should not configuration" do
    salt_short = ENV['SALT_SHORT']
    ENV['SALT_SHORT'] = nil
    expect { PrefixApiKey.configuration.valid? }.to raise_error(StandardError)
    ENV['SALT_SHORT'] = salt_short
  end

  it 'Should configuration' do
    set_configuration
    expect(PrefixApiKey.configuration.valid?).to be_truthy
  end
end
