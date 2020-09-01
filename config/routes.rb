Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :whiistles, only: %i[index create]
  resources :users, only: [:show]
  resources :followings, only: %i[create destroy]
  root 'whiistles#index'
end
