Rails.application.routes.draw do
  get 'user_preferences/index'

  get 'user_preferences/new'

  get 'user_preferences/create'

  get 'user_preferences/edit'

  get 'user_preferences/update'

  get 'user_preferences/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
