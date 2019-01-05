Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  resources :users

  resources :categories do
    resources :items
  end

  resources :orders do
    post :add_item_to_order, on: :collection
  end

  # root 'items#index'
  root 'application#home'

end
