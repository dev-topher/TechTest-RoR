Rails.application.routes.draw do
  resources :restaurants
  resources :devices
  devise_for :users
  root "home#index"

  namespace :api do
    namespace :v1 do
      resources :restaurants
      resources :devices
    end
  end

end
