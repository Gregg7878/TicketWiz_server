Rails.application.routes.draw do
  resources :mpesas

  # resources :organisers
  # resources :customers

  post "/signup", to: "customers#create" 
  get "/me", to: "customers#show"
  post "login", to:"customer_sessions#create" 
  delete "/logout", to: "customer_sessions#destroy" 
  get "/meOrg", to: "organisers#show"    
  post "/signupOrg", to: "organisers#create" 
  post "loginOrg", to:"organiser_sessions#create"
  delete "/logoutOrg", to: "organiser_sessions#destroy"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :payments
  resources :bookings

  get '/featured_events', to: 'events#featured'

  post "stkpush", to: "mpesas#stkpush"
  
  # Defines the root path route ("/")
  # root "articles#index"

  resources :calendar_events, only: [:index, :create, :destroy]
  resources :tickets, only: [:index, :create, :show, :destroy]

end
