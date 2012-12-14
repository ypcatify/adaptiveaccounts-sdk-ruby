# AdaptiveAccounts Samples

Add following line in rails `Gemfile`:

    gem 'paypal-sdk-adaptiveaccounts'
    gem 'adaptive_accounts_samples', :git => "https://github.com/paypal/adaptiveaccounts-sdk-ruby.git", :group => :development

Configure routes(`config/routes.rb`):

    mount AdaptiveAccountsSamples::Engine => "/samples" if Rails.env.development?

To get default paypal configuration execute:

    rails g paypal:sdk:install

Run `rails server` and check the samples.
