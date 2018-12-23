Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items

  resources :categories do
    resources :items
  end

  root 'application#home'
end
