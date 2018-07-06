Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: 'users#create'
      post '/login', to: 'authorization#create'

      resources :workspaces, only: [:index]
    end
  end
end
