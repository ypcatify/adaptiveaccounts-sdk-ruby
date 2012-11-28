Dummy::Application.routes.draw do

  mount AdaptiveAccountsSamples::Engine => "/samples", :as => :adaptive_accounts_samples

  root :to => redirect("/samples")

end
