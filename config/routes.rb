Rails.application.routes.draw do
  root "pods#index"

  resources :pods


end
