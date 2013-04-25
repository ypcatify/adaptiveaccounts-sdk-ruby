require 'paypal-sdk-core'

module PayPal
  module SDK
    module AdaptiveAccounts
      class API < Core::API::Platform
        include Services

        def initialize(environment = nil, options = {})
          super(SERVICE_NAME, environment, options)
        end

        ADAPTIVE_ACCOUNTS_HTTP_HEADER = { "X-PAYPAL-REQUEST-SOURCE" => "adaptiveaccounts-ruby-sdk-#{VERSION}" }
        def default_http_header
          super.merge(ADAPTIVE_ACCOUNTS_HTTP_HEADER)
        end

        # Validate IPN message
        def ipn_valid?(raw_post_data)
          Core::API::IPN.valid?(raw_post_data, config)
        end
      end
    end
  end
end

