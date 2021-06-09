Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'
  root to: "home#index"

  devise_for :users

  resources :teams do
    resources :clients
  end
end
