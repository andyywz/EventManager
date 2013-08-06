EventManager::Application.routes.draw do
  devise_for :users

  root :to => "events#index"
  resources :users, only: [:index, :show]
  resources :events
end
