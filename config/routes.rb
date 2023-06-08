Rails.application.routes.draw do
  root to: "home#index"
  resources :contents
  devise_for :users, controllers: { registrations: 'users/registrations' }
end
