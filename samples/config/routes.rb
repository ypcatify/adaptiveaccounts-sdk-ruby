AdaptiveAccountsSamples::Engine.routes.draw do
  post  "adaptive_accounts/ipn_notify" => "adaptive_accounts#ipn_notify", :as => :ipn_notify
  match "adaptive_accounts(/:action)", :controller => "adaptive_accounts", :as => :adaptive_accounts
  root :to => "adaptive_accounts#index"
end
