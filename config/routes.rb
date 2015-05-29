Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show] do
    resources :domains, shallow: true
  end

  get 'welcome/index'
  get 'welcome/about'
  
  root to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]  
  end

end
