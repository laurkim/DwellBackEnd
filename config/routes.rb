Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: 'users#create'
      post '/login', to: 'authorization#create'
      post '/fetch_user', to: 'users#show'
      resources :workspaces, only: [:index]
      resources :bookings, only: [:index, :create]
      resources :favorites, only: [:create, :destroy]
    end
  end
end
