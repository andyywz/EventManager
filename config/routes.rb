EventManager::Application.routes.draw do
  root :to => "events#index"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
  ActiveAdmin.routes(self)
  resources :users, only: [:index, :show]
  resources :events
end
