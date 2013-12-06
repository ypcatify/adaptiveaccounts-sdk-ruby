$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "adaptive_accounts_samples/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "adaptive_accounts_samples"
  s.version     = AdaptiveAccountsSamples::VERSION
  s.authors     = ["PayPal"]
  s.email       = ["DL-PP-Platform-Ruby-SDK@paypal.com"]
  s.homepage    = "https://www.x.com/"
  s.summary     = "Samples for AdaptiveAccounts."
  s.description = "Samples for AdaptiveAccounts."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.2.9"
  s.add_dependency "paypal-sdk-adaptiveaccounts"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "simple_form"
  s.add_dependency "haml"
  s.add_dependency "coderay"
  s.add_dependency "jquery-rails"
end
