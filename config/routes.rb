Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  put '/runs/:id/upvotes', to: 'runs#upvotes'
  put '/runs/:id/declines', to: 'runs#declines'
  resources :users, except: [:index, :destroy] do
    resources :profiles, except: [:index, :destroy]
    resources :moods, except: [:show]
    resources :runs
  end
  resources :sessions, only: [:new, :create, :destroy]
  root 'pages#show'
end
