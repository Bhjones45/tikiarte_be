Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'sessions/create', to: 'sessions#create'
      resources :inspiration, only: [:index]
      resources :public_gallery, only: [:index]

      resources :artists, only: [] do
        get '/images', to: 'artists/images#index'
        post '/images', to: 'artists/images#create'
        put '/images/:id', to: 'artists/images#update'
        delete '/images/:id', to: 'artists/images#delete'
      end

      resources :directors, only: [:show] do
        get '/artists', to: 'directors/artists#index'
        post '/artists', to: 'directors/artists#create'
        get '/artists/:id', to: 'directors/artists#show'
        put '/artists/:id', to: 'directors/artists#update'
        delete '/artists/:id', to: 'directors/artists#delete'
      end
    end
  end
  post '/presigned_url', to: 'direct_upload#create'
end
