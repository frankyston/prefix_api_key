# frozen_string_literal: true

RSpec.describe 'PrefixApiKey::Check' do
  context 'Check token' do
    it 'Should return true after check token' do
      set_configuration
      result = ::PrefixApiKey::Generate.call(prefix: 'my-company')
      check = ::PrefixApiKey::Check.call(token: result[:token], hash: result[:long_token_hash])
      expect(check).to eq(true)
    end

    it 'Should return false after check token' do
      set_configuration
      result = ::PrefixApiKey::Generate.call(prefix: 'my-company')
      check = ::PrefixApiKey::Check.call(token: result[:token], hash: "#{result[:long_token_hash]}123")
      expect(check).to eq(false)
    end
  end
end
