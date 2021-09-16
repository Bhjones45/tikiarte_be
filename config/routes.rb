Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'sessions/create', to: 'sessions#create'

      resources :directors, only: [:show]
    end
  end
end
