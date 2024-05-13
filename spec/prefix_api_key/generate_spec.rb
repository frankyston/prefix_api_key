# frozen_string_literal: true

RSpec.describe 'PrefixApiKey::Generate' do
  it 'Should generate a token with prefix' do
    set_configuration
    result = ::PrefixApiKey::Generate.call(prefix: 'prefix')
    expect(result[:prefix]).to eq('prefix')
    expect(result[:short_token].length).to eq(7)
  end

  it 'Should generate a token with company_test' do
    set_configuration
    result = ::PrefixApiKey::Generate.call(prefix: 'company_test')
    expect(result[:prefix]).to eq('company_test')
  end

  context 'When configuration is not set' do
    before do
      PrefixApiKey.configuration.salt_long = nil
    end
    it 'Should raise an error' do
      expect { ::PrefixApiKey::Generate.call(prefix: 'prefix') }.to raise_error(StandardError)
    end
  end
end
