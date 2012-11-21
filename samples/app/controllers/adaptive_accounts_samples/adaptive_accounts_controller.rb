require_dependency "adaptive_accounts_samples/application_controller"

module AdaptiveAccountsSamples
  class AdaptiveAccountsController < ApplicationController
    include PayPal::SDK::AdaptiveAccounts

    SERVICE_ACTIONS = Services.instance_methods.select{|s| s =~ /^[A-Z]/ and s !~ /^Build/ }
    build_services(SERVICE_ACTIONS, "", "_response", "Request")

    def index
      redirect_to :action => :create_account
    end

    private

    def api
      @api ||= API.new
    end
  end
end
