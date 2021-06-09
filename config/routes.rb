Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

  devise_for :users

  resources :teams do
    resources :clients
  end

  root to: 'home#index'
end
