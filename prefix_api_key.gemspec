# frozen_string_literal: true

require_relative "lib/prefix_api_key/version"

Gem::Specification.new do |spec|
  spec.name = "prefix_api_key"
  spec.version = PrefixApiKey::VERSION
  spec.authors = ["Frankyston Lins"]
  spec.email = ["frankyston@gmail.com"]

  spec.summary = "Generate a prefix API key for your application"
  spec.description = "Generate a prefix API key for your application"
  spec.homepage = "https://github.com/frankyston/prefix_api_key"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/frankyston/prefix_api_key"
  spec.metadata["changelog_uri"] = "https://github.com/frankyston/prefix_api_key/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files = Dir['lib/**/*.rb'] + Dir['bin/*']

  spec.add_dependency("builder")
  spec.add_dependency("bundler")
  spec.add_dependency("rake")
  spec.add_dependency("activesupport")

  spec.add_development_dependency("pry-byebug", "~> 3.9")
  spec.add_development_dependency("uuid", "~> 2.3", ">= 2.3.9")
  spec.add_development_dependency("rspec", "~> 3.10")
  spec.add_development_dependency("dotenv", "~> 2.7", ">= 2.7.6")

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
