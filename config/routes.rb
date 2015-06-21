Rails.application.routes.draw do
  root "pods#index"

  resources :pods do
    resources :comments
  end


  resources :users, only: [:new, :create]


  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
