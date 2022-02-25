Rails.application.routes.draw do
  devise_for :users
  root to: "forms#index"

  resources :forms, only: [:index, :create, :new]
end
