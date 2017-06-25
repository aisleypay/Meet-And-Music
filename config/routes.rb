Rails.application.routes.draw do
  get 'auth/create'

  get 'auth/show'

  get 'artist/index'

  get 'artist/new'

  get 'artist/create'

  get 'artist/show'

  get 'artist/edit'

  get 'artist/update'

  get 'artist/destroy'

  get 'band/index'

  get 'band/new'

  get 'band/create'

  get 'band/show'

  get 'band/edit'

  get 'band/update'

  get 'band/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
