Rails.application.routes.draw do
  get 'activities/index'

  get 'pages/user_preferences'
  resources :user_preferences, only: [:new, :create]

  get 'pages/preferences'

  devise_for :users
  root to: 'pages#home'


  resources :trips, only: [:create, :index, :show] do

  resources :trip_activities, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
