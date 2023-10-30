Rails.application.routes.draw do
  resources :mpesas

  # resources :organisers
  # resources :customers

  post "/signupOrg", to: "organisers#create" 
  post "/signup", to: "customers#create" 
  get "/meOrg", to: "organisers#show"    
  get "/me", to: "customers#show"
  post "login", to:"customer_sessions#create"   
  delete "/logout", to: "customer_sessions#destroy" 
  post "loginOrg", to:"organiser_sessions#create"
  delete "/logoutOrg", to: "organiser_sessions#destroy"

  get '/customer_profile', to: 'customers#profile'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :payments
  resources :bookings

  # Defines the root path route ("/")
  # root "articles#index"
end
