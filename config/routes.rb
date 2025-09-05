Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html




  get "/", to: "weather#index"
  get "/weather", to: "weather#show"


  # Defines the root path route ("/")
  root "weather#index"
end
