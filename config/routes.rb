Rails.application.routes.draw do
  root 'recipes#index'

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  resources :recipes do
    resources :comments
  end

  get '/about'=> 'about#index', as: :about

  resources :sessions, only: [:new, :create]

  resources :users

  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  delete '/logout' => 'sessions#destroy', as: :logout


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
