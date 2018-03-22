Rails.application.routes.draw do
  get 'activities/index'

  get 'pages/user_preferences'
  resources :user_preferences, only: [:new, :create, :edit, :update]

  get 'pages/preferences'

  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'

  get "gogo", to: "pages#gogo"

  get "profile", to: "pages#profile"

  resources :trips, only: [:create, :index, :show] do
    resources :trip_activities, only: [:index, :new, :create]
  end

  patch 'trip_activities/:id/visited', to: 'trip_activities#visited', as: :visited
  patch 'trip_activities/:id/not_visited', to: 'trip_activities#not_visited', as: :not_visited
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
