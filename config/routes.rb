Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  namespace :api do
     get "pokemon/:id", :to => "pokemon#show" 
     get "pokemon/random/ou", :to => "pokemon#random_ou"
     get "pokemon/random/ou/:move", :to => "pokemon#random_move"
  end
      
  

  devise_for :users
end
