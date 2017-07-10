Rails.application.routes.draw do
  devise_for :users

  resource :subscription
  resources :products

  root to: "products#index"
end
