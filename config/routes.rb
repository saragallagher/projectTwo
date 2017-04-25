Rails.application.routes.draw do
  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  resources :recipes
  get '/about'=> 'about#index', as: :about

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

  root 'users#new'
  resources :users

  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
