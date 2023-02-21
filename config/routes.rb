Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :whiistles, only: %i[new show index create] do 
    resources :likes, only: [:create, :destroy], controller: "whiistles/likes"
    resources :reply, only: [:new, :create], controller: "whiistles/replies"
    resources :rewhiistle, only: [:create, :destroy], controller: "whiistles/rewhiistles"
    resources :quoted_whiistle, only: [:new], controller: "whiistles/quoted_whiistles"
    resources :pictures, only: [:index], controller: "whiistles/pictures"
  end
  resources :users, only: [] do 
    resources :followings, only: [:index], controller: "users/followings"
    resources :followers, only: [:index], controller: "users/followers"
    resources :whiistles, only: [:index], controller: "users/whiistles"
    resources :whiistles_with_replies, only: [:index], controller: "users/whiistles_with_replies"
    resources :medias, only: [:index], controller: "users/medias"
    resources :liked_whiistles, only: [:index], controller: "users/liked_whiistles"
  end
  resources :relations, only: %i[create destroy]
  root 'whiistles#index'

end
