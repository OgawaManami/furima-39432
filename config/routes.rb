Rails.application.routes.draw do

  devise_for :users
    root to: 'items#index'
    resources :items , only: [:new, :create, :show, :edit, :destroy, :update] do
    resources :orders, only: [:index, :new, :create]
    root to: "posts#index"
    resources :posts, only: [:new, :create, :show, :edit, :update]
    resources :items, only: [:new, :create, :show, :edit, :update] do
      resources :comments, only: :create
  end
end