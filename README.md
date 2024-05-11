# Prefix Api Key

This gem is intended to generate and verify Prefix Api Key for ruby.

## Installation

Add your Gemfile:
```ruby
gem 'prefix_api_key'
```

Execute in bash:
```bash
bundle install
```

or install directly in bash:
```bash
gem install prefix_api_key
```

## Usage

Configure 4 environment variables in your project
```bash
SALT_SHORT
SALT_LONG
PASSWORD_SHORT
PASSWORD_LONG
```

Configure initialize for the gem to use the 4 environment variables
```ruby
PrefixApiKey.configure do |config|
	config.salt_short = ENV['SALT_SHORT']
	config.salt_long = ENV['SALT_LONG']
	config.password_short = ENV['PASSWORD_SHORT']
	config.password_long = ENV['PASSWORD_LONG']
end
```

Generating an Prefix Api Key
```ruby
require 'prefix_api_key'
result = PrefixApiKey::Generate.call(prefix: 'franat')
{
	:short_token=>"bXktY29",
	:long_token=>"MTIzNGFzZGYxMjM0NTZteS1jb21wYW55",
	:long_token_hash=>"100debb3a4d86c39df892b4ebd00f86b64e16870c224f07e8393b9993b02944e",
	:token=>"my-company_bXktY29_MTIzNGFzZGYxMjM0NTZteS1jb21wYW55",
	:prefix=>"my-company"
}
```

Validating a token
```ruby
require 'prefix_api_key'
result = PrefixApiKey::Generate.call(prefix: 'my-company')
token = result[:token]
hash = result[:long_token_hash]

PrefixApiKey::Check.call(token: token, hash: hash)
# => true
```

## Development

Download the project, run bundle install to install dependencies.

Now just make the changes you want.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frankyston/prefix_api_key. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/frankyston/prefix_api_key/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PrefixApiKey project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/frankyston/prefix_api_key/blob/main/CODE_OF_CONDUCT.md).
