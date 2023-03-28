Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :likes
    end
  end
  
  resources :posts
  resources :favorites, only: [:create, :destroy]
  
  resources :tags, only: [:create]
end
