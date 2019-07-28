Rails.application.routes.draw do
  root to: 'home#index'
  
  # User routes
  devise_for :users
  resources :users, only: [:index, :show]
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
  
  resources :restoration_activity_log_entries
  resources :nursery_tables
  resources :zones
  resources :dives, only: [:new, :create, :show] do
    post :finish, on: :member
  end

end
