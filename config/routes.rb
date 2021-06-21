Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

  devise_for :users

  resources :teams do
    resources :clients

    get 'integrations/companies_house/profile',
        to: 'integrations/companies_house#company_profile',
        as: 'companies_house_profile'
  end


  root to: 'home#index'
end
