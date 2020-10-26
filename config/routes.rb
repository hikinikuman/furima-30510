Rails.application.routes.draw do
  #get 'categories/index'
  #get 'categories/new'
  devise_for :users
  root to: 'items#index' 
  resources :items
  resources :purchases, only: [:index]

end
