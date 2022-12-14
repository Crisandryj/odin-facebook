Rails.application.routes.draw do
  get 'posts/new'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_scope :user do
  # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  resources :likes
  resources :users
  resources :friends
  resources :requests
  resources :posts
  resources :comments
end
