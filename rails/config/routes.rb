Rails.application.routes.draw do
  resources :restoration_activity_log_entries
  root to: 'home#index'
  devise_for :users  
  resources :nursery_tables
  resources :zones
  resources :dives, only: [:new, :create, :show]

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
  resources :users, only: [:index, :show]

  root to: 'home#index'
end
