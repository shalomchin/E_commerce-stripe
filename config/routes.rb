Rails.application.routes.draw do
  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :carts do
    resources :payments, only: [:create, :new]
  end

  resources :products do
    resources :line_items, only: [:create, :new]
  end 

  resources :line_items, only: [:destroy, :update]

  get 'products/index'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
