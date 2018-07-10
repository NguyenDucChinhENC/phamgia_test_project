Rails.application.routes.draw do
  get 'user/:id', to: "user#show", as: 'user_path'
  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:new, :create, :show]
  # devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
