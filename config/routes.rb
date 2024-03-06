Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "readings#index"
  resources :playlists, only: [:index, :show, :create, :destroy, :update] do
    resources :playlist_items, only: [:destroy]
  end
  resources :books, only: [:index, :create]
  resources :books, only: [:show] do
    resources :readings, only: [:create]
  end
  resources :readings, only: [:show] do
    resources :suggestions, only: [:create]
    resources :playlist_items, only: [:create]
  end
  resources :readings, only: [:new, :create]
end
