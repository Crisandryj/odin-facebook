Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/new'
  get 'requests/create'
  get 'requests/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  resources :users
  resources :friends
end
