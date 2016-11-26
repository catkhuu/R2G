Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  resources :users, except: [:index, :destroy] do
    resources :profiles, except: [:index, :destroy]
    resources :moods, except: [:show]
    resources :runs
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'pages#show'
end
