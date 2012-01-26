StockTracker::Application.routes.draw do
  resources :transactions

  match '/login' => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  match '/signup' => 'users#new'
  match '/users/:id/edit' => "users#update"

  resources :users
  resources :sessions
  root :to => 'home#index'
end
