Rails.application.routes.draw do
  root "questions#index"
  resources :questions, only: [:new, :create, :edit, :update, :destroy]
  resources :answers, only: [:update]
end
