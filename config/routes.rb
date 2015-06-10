Rails.application.routes.draw do
  root "pods#index"

  get "/pods" => "pods#new"
  post "/pods" => "pods#create"

  get "/pods/:id" => "pods#edit", as: :pod
  patch "/pods/:id" => "pods#udpate"

  get "/pods/:id" => "pods#destroy", as: :delete



end
