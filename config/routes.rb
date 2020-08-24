Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  #get "/auth/google_oauth2/callback", to: "sessions#create"
  get "auth/:provider/callback", to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  post "add_friends", to: "friends#create"
  post "add_to_calendar", to: "calendars#create"
  get '/movies/discover', to: 'movies#index'
  get '/movies/search', to: "movies#search"
  get '/movies/search/results', to: 'movies#index'
  get '/movies/top_rated', to: 'movies#top_rated'
  get "movie_show", to: "movies#show"
end
