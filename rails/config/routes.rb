Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "home#index"

    # User routes
    devise_for :users
    resources :users, only: %i[index show]
    devise_scope :user do
      get "sign_in", to: "devise/sessions#new"
      get "sign_up", to: "devise/registrations#new"
    end

    resources :restoration_activity_log_entries
    resources :nursery_tables
    resources :zones
    resources :dives, only: %i[new create show] do
      post :finish, on: :member
      resources :restoration_activity_log_entries, only: %i[new create]
    end

    devise_scope :user do
      get "sign_in", to: "devise/sessions#new"
      get "sign_up", to: "devise/registrations#new"
    end

    resources :users, only: %i[index show]
  end
end
