Rails.application.routes.draw do
  devise_for :users
  root to: "forms#index"

  resources :forms, only: [:index, :create, :new] do
    resources :questions, only: [:index, :create, :new, :destroy]
  end
end
