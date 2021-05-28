Rails.application.routes.draw do

  get 'messages/new'
  devise_for :users

  root to: 'items#index'
  
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages, only: [:create]
    mount ActionCable.server, at: '/cable'
  end

end