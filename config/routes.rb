Rails.application.routes.draw do

  devise_for :users

  root to: 'items#index'
  
  resources :items do
    resourcs :orders, only: [:index, :create]
  end
  
end