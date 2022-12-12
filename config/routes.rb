Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :whiistles, only: %i[show index create] do 
    resources :likes, only: [:create, :destroy], controller: "whiistles/likes"
    resources :reply, only: [:new, :create], controller: "whiistles/replies"
    resources :rewhiistle, only: [:create, :destroy], controller: "whiistles/rewhiistles"
    resources :quoted_whiistle, only: [:new, :create], controller: "whiistles/quoted_whiistles"
  end
  resources :users, only: [] do 
    resources :followings, only: [:index], controller: "users/followings"
    resources :followers, only: [:index], controller: "users/followers"
    resources :whiistles, only: [:index], controller: "users/whiistles"
    resources :medias, only: [:index], controller: "users/medias"
  end
  resources :relations, only: %i[create destroy]
  root 'whiistles#index'

end
