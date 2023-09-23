Rails.application.routes.draw do
  get 'furimas/index'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :users, only: [:edit, :update]
end
