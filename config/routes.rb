Rails.application.routes.draw do
  #get 'categories/index'
  #get 'categories/new'
  devise_for :users
  root to: 'items#index' 
  resources :items, only: [:index, :new, :create]
  resources :purchases, only: [:index]

end
