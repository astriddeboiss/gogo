Rails.application.routes.draw do
  get 'pages/user_preferences'
  resources :user_preferences, only: [:new, :create]

  get 'pages/preferences'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
