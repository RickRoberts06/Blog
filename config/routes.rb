Rails.application.routes.draw do
  root "pods#index"

  resources :pods do
    resources :comments 
  end


end
