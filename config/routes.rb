Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/users', to: 'auth#index'
      get 'bands/:id/searchArtists', to: 'bands#searchArtists'
      resources :artists
      resources :bands
      resources :users
      resources :genres, only: [:create]
      resources :instruments, only: [:create]
      resources :decisions, only: [:create]
    end
  end
end
