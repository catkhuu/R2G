Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  get '/runs/search' => 'runs#search'
  get '/runs/new_search' => 'runs#new_search'
  resources :users, except: [:index, :destroy] do
    resources :profiles, except: [:index, :destroy]
    resources :runs
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'pages#show'
end
