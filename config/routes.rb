Rails.application.routes.draw do
  get 'furimas/index'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :users, only: [:new, :create, :edit, :update]do
end
resources :users, only: :show
end
