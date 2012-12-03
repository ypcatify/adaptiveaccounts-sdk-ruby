require 'paypal-sdk-core'

module PayPal
  module SDK
    module AdaptiveAccounts
      autoload :Version,   "paypal-sdk/adaptive_accounts/version"
      autoload :Services,  "paypal-sdk/adaptive_accounts/services"
      autoload :DataTypes, "paypal-sdk/adaptive_accounts/data_types"
      autoload :API,       "paypal-sdk/adaptive_accounts/api"

      def self.new(*args)
        API.new(*args)
      end
    end
  end
end
