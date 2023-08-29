Rails.application.routes.draw do
  resources :restaurants
  resources :devices
  devise_for :users
  root "home#index"
end
