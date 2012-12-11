# AdaptiveAccounts

SDK for AdaptiveAccounts.

## Installation

Add this line to your application's Gemfile:

    gem 'paypal-sdk-adaptiveaccounts'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal-sdk-adaptiveaccounts

## Configuration

For Rails application:

    rails g paypal:sdk:install

For other ruby application, create a configuration file(`config/paypal.yml`):

    development: &default
      username: jb-us-seller_api1.paypal.com
      password: WX4WTU3S8MY44S7F
      signature: AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy
      app_id: APP-80W284485P519543T
      http_timeout: 30
      mode: sandbox
      # # with certificate
      # cert_path: "config/cert_key.pem"
      # # with token authentication
      # token: ESTy2hio5WJQo1iixkH29I53RJxaS0Gvno1A6.YQXZgktxbY4I2Tdg
      # token_secret: ZKPhUYuwJwYsfWdzorozWO2U9pI
      # # with Proxy
      # http_proxy: http://proxy-ipaddress:3129/
      # # with device ip address
      # device_ipaddress: "127.0.0.1"
    test:
      <<: *default
    production:
      <<: *default
      mode: live

Load Configurations from specified file:

    PayPal::SDK::Core::Config.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')

## Create API object

Create API object:

    api = PayPal::SDK::AdaptiveAccounts::API.new

Override configuration while creating a object:

    api = PayPal::SDK::AdaptiveAccounts::API.new(:development)
    api = PayPal::SDK::AdaptiveAccounts::API.new(:development, :app_id => "XYZ")
    api = PayPal::SDK::AdaptiveAccounts::API.new(:app_id => "XYZ")    # Take default environment.

Change configuration:

    api.set_config :testing
    api.set_config :testing, app_id => "XYZ"


## Build Request Object

To make api request, we need to build a request object.

    # To build a empty request object for get verified status
    get_verified_status_request = api.build_get_verified_status()

    # To build a request object with default data
    get_verified_status_request = api.build_get_verified_status( :emailAddress => "test@example.com", :matchCriteria => "NONE" )

    # To build a request object with block
    get_verified_status_request = api.build_get_verified_status do
      self.emailAddress  = "test@example.com"
      self.matchCriteria = "NONE"
    end

The Build method can be access with camelcase or underscore:

    api = api.build_get_verified_status()
    # (or)
    api = api.BuildGetVerifiedStatus()

## Assign value to members

Members can be access with camelcase or underscore format.

    create_account_request.name.firstName = "first name"
    # With underscore
    create_account_request.name.first_name = "first name"

To Assign multiple values:

    create_account_request.name = { :firstName = "first", :lastName => "last" }

To Assign values with block

    create_account_request.name do
      self.firstName = "first"
      self.lastName  = "last"
    end

To Get members list for the given object( For Reference ):

    create_account_request.members
    create_account_request.name.members

## Make API Request

Make api call with request object:

    get_verified_status_response = api.get_verified_status(get_verified_status_request)

Make api call with hash:

    get_verified_status_response = api.get_verified_status( :emailAddress => "test@example.com", :matchCriteria => "NONE" )


## Access values from response object

To get response status:

    get_verified_status_response.responseEnvelope.ack


## Example

```ruby
require 'paypal-sdk-adaptiveaccounts'
@api = PayPal::SDK::AdaptiveAccounts::API.new

# Build request object
@get_verified_status_request = @api.build_get_verified_status()
@get_verified_status_request.emailAddress  = "test@example.com"
@get_verified_status_request.matchCriteria = "NONE"

# Make API call & get response
@get_verified_status_response = @api.get_verified_status(@get_verified_status_request)

# Access Response
@get_verified_status_response.responseEnvelope
@get_verified_status_response.accountStatus
@get_verified_status_response.countryCode
@get_verified_status_response.userInfo
```

## Samples

Add following line in rails `Gemfile`:

    gem 'paypal-sdk-adaptiveaccounts'
    gem 'adaptive_accounts_samples', :git => "https://github.com/paypal/adaptiveaccounts-sdk-ruby.git", :group => :development

Configure routes(`config/routes.rb`):

    mount AdaptiveAccountsSamples::Engine => "/samples" if Rails.env.development?

To get default paypal configuration execute:

    rails g paypal:sdk:install

Run `rails server` and check the samples.
