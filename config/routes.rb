Rails.application.routes.draw do
  get 'activities/index'

  get 'pages/user_preferences'
  resources :user_preferences, only: [:edit, :update]
  resources :signup_user_preferences, only: [:new, :create], controller: "user_preferences/sign_up"
  resources :profile_user_preferences, only: [:new, :create], controller: "user_preferences/edit_profile"

  get 'pages/preferences'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get "choice_trip", to: "pages#choice_trip"

  post "gogo", to: "pages#gogo"

  get "profile", to: "pages#profile"

  post "cityfind", to: "pages#city_find"

  resources :trips, only: [:create, :index, :show] do
    resources :trip_activities, only: [:index, :new, :create]
  end

  patch 'trip_activities/:id/visited', to: 'trip_activities#visited', as: :visited
  patch 'trip_activities/:id/not_visited', to: 'trip_activities#not_visited', as: :not_visited
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
