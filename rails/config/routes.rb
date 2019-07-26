Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users  
  resources :nursery_tables
  resources :zones

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
