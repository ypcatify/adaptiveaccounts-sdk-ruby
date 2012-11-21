AdaptiveAccountsSamples::Engine.routes.draw do
  match "adaptive_accounts(/:action)",  :controller => "adaptive_accounts", :as => :adaptive_accounts
  root :to => "adaptive_accounts#index"
end
