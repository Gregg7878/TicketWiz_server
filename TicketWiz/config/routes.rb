Rails.application.routes.draw do

  # resources :organisers
  # resources :customers

  # post "/signupOrg", to: "organisers#create" 
  # post "/signup", to: "customers#create" 
  # get "/meOrg", to: "organisers#show"
  # get "/me", to: "customers#show"
  # post "login", to:"customer_sessions#create" 
  # delete "/logout", to: "customer_sessions#destroy" 
  # post "loginOrg", to:"organiser_sessions#create"
  # delete "/logoutOrg", to: "organiser_sessions#destroy"

  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :events
  # resources :payments
  
  # # Defines the root path route ("/")
  # # root "articles#index"

  # # resources :calendar_events, only: [:index, :create, :destroy]
  # # resources :tickets, only: [:index, :create, :show, :destroy]

  resources :customers, only: [:index, :show, :create, :update, :destroy]
  resources :organisers, only: [:index, :show, :create, :update, :destroy]
  resources :events, only: [:index, :show, :create, :update, :destroy]
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :calendar_events, only: [:index, :show, :create, :update, :destroy]
  resources :payments, only: [:index, :show, :create, :update, :destroy]

end
