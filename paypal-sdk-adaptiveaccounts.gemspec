# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal-sdk/adaptive_accounts/version'

Gem::Specification.new do |gem|
  gem.name          = "paypal-sdk-adaptiveaccounts"
  gem.version       = PayPal::SDK::AdaptiveAccounts::VERSION
  gem.authors       = ["PayPal"]
  gem.email         = ["DL-PP-Platform-Ruby-SDK@ebay.com"]
  gem.description   = %q{AdaptiveAccounts SDK}
  gem.summary       = %q{AdaptiveAccounts SDK}
  gem.homepage      = "https://www.x.com/"

  gem.files         = Dir["{bin,spec,lib}/**/*"] + ["Rakefile", "README.md", "Gemfile"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('paypal-sdk-core', '~> 0.1.1')
end
