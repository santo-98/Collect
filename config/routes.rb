Rails.application.routes.draw do
  devise_for :users
  root to: "forms#index"

  resources :forms, only: [:index, :create, :new, :show] do
    resources :customers, only: [:index, :create, :new, :destroy]
    resources :questions, only: [:index, :create, :new, :destroy]
    resources :responses, only: [:index, :create]
  end
end
