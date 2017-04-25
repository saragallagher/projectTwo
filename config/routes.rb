Rails.application.routes.draw do
  resources :recipes do
    resources :comments
  end
  get '/about'=> 'about#index', as: :about

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]

  root 'users#new'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
