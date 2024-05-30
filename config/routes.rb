Rails.application.routes.draw do
  devise_for :users

  root "products#index"

  get "dashboard", to: "dashboards#dashboard"

  get "/profile", to: "profiles#profile", as: :my_profile
  patch "/profile", to: "profiles#update", as: :profile

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :offer_products, only: [:index]
  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :offers, only: [:index, :show]
  resources :profiles, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :categories, only: [:index]
end
