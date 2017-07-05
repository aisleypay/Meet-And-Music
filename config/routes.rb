Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/users', to: 'auth#index'
      get 'bands/:id/recommended-artists', to: 'bands#recommended_artists'
      get 'artists/:id/recommended-bands', to: 'artists#recommended_bands'
      get 'bands/search-bands', to: 'bands#search_bands'
      get 'artists/search-artists', to: 'artists#search_artists'
      get 'artists/featured', to: 'artists#featured'
      get 'bands/featured', to: 'bands#featured'
      post 'users/:id/reach-out', to: 'users#reach_out'
      resources :artists
      resources :bands
      resources :users
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :decisions, only: [:create, :index]
    end
  end
end
