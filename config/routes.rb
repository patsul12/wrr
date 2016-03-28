Rails.application.routes.draw do
  root "questions#index"
  resources :questions, only: [:create, :edit, :update]
end
