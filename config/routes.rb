Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  resources :restaurants, only: %i[index]
  resources :selections, only: %i[index]
  resources :users do
    resources :places
  end
end
