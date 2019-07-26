Rails.application.routes.draw do
  resources :nursery_tables
  resources :zones
  root to: 'home#index'
end
