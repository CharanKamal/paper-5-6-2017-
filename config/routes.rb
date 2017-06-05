Rails.application.routes.draw do
  get 'password_resets/new'

  #get 'sessions/new'

  #get 'users/index'

  #get 'users/show'

  #get 'users/new'
  root 'users#new'
  resources :users
  resources :sessions
  post 'sessions/new', to: 'users#index'
  resources :friendships
  resources :password_resets


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
