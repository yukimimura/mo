Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'timeline', to: 'timelines#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :posts
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
