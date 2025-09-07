Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html




  get "/", to: "weather#index"
  post "/weather/search", to: "weather#search", as: "search_weather"


  # Defines the root path route ("/")
  root "weather#index"
end
