Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/users', to: 'auth#index'
      get 'bands/:id/searchArtists', to: 'bands#searchArtists'
      get 'artists/:id/searchBands', to: 'artists#searchBands'
      resources :artists
      resources :bands
      resources :users
      resources :instruments, only: [:index]
      resources :genres, only: [:index]
      resources :decisions, only: [:create]
    end
  end
end
