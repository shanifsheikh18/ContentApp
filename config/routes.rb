Rails.application.routes.draw do
  root to: "home#index"
  # resources :contents
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :contents do
    resources :comments, only: [:create]
    resources :feedbacks, only: [:create]
  end
end
