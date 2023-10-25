Rails.application.routes.draw do
  
  # resources :organisers, only: [:create, :show]
  # resources :customers, only: [:create, :show]

  post "/signupOrg", to: "organisers#create" 
  post "/signup", to: "customers#create" 
  get "/meOrg", to: "organisers#show"    
  get "/me", to: "customers#show"
  post "login", to:"customer_sessions#create"   
  delete "/logout", to: "customer_sessions#destroy" 
  post "loginOrg", to:"organiser_sessions#create"
  delete "/logoutOrg", to: "organiser_sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :payments
  resources :bookings

  get '/featured_events', to: 'events#featured'
  
  # Defines the root path route ("/")
  # root "articles#index"

  resources :calendar_events, only: [:index, :create, :destroy]
  resources :tickets, only: [:index, :create, :show, :destroy]

 

end
