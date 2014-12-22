Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  namespace :api do
    match "pokemon/all", :to => "pokemon#all", :via => [:options, :get]
     match "pokemon/:id", :to => "pokemon#show", :via => [:options, :get]
     match "pokemon/id/:id", :to => "pokemon#by_id", :via => [:options, :get]
     match "pokemon/autocomplete/:species", :to => "pokemon#autocomplete", :via => [:get, :options]
     match "pokemon/random/format/ou", :to => "pokemon#random_ou", :via => [:options, :get]
     match "pokemon/random/format/:format", :to => "pokemon#random_format", :via => [:options, :get]
     match "pokemon/random/from/:tier/with/:move", :to => "pokemon#random_move", :via => [:options, :get]

     match "team/:id", :to => "team#show", :via => [:options, :get]
     match "team/:id/update", :to => "team#update", :via => [:options, :post]
     match "teams/create", :to => "team#create", :via => [:options, :post, :get]
     match "teams/list", :to => "team#list", :via => [:options, :get]
  end      

  

  get "/auth/:provider/callback", to: "session#create"

end
