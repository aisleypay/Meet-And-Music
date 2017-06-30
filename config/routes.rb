Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/users', to: 'auth#index'
      get 'bands/:id/recommended-artists', to: 'bands#recommendedArtists'
      get 'artists/:id/recommended-Bands', to: 'artists#recommendedBands'
      get 'bands/search-bands', to: 'bands#searchBands'
      get 'artists/search-artists', to: 'artists#searchArtists'
      resources :artists
      resources :bands
      resources :users
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :decisions, only: [:create]
    end
  end
end
