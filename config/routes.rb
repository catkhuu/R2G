Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  resources :users, except: [:index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  root 'pages#show'
end
