Rails.application.routes.draw do
  get 'registration/new'

  get 'activities/index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get "gogo", to: "trip_activities#gogo"

  post "gogo", to: "trip_activities#gogo"

  get "profile", to: "pages#profile"

  post "cityfind", to: "trip_activities#city_find"

  resources :trips, only: [:create, :index, :show] do
    resources :user_preferences, only: [:index, :new, :create]
    resources :trip_activities, only: [:index, :new, :create]
    get :select_preferences, on: :member
  end
  resources :user_preferences, only: :destroy
  resources :activities, only: [ :show ]
  patch 'trip_activities/:id/visited', to: 'trip_activities#visited', as: :visited
  patch 'trip_activities/:id/not_visited', to: 'trip_activities#not_visited', as: :not_visited
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
