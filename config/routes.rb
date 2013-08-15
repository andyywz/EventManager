EventManager::Application.routes.draw do
  root :to => "events#index"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
  ActiveAdmin.routes(self)
  resources :users, only: [:index, :show]
  # resources :events
  resources :events do
    resources :occurrences, only: :new
  end
  # resources :occurrences, except: :new
  resources :occurrences, except: :new do
    resources :attendings, only: :index
    resource :attendings, only: [:create, :destroy]
  end  
end
