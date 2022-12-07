Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :whiistles, only: %i[index create]
  resources :users, only: [] do 
    resources :followings, only: [:index], controller: "users/followings"
    resources :followers, only: [:index], controller: "users/followers"
    resources :whiistles, only: [:index], controller: "users/whiistles"
  end
  resources :relations, only: %i[create destroy]
  root 'whiistles#index'

end
