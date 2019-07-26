Rails.application.routes.draw do
  resources :zones
  root to: 'home#index'
end
