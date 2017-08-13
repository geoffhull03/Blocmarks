Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  resources :users
  
  root 'welcome#index'
end
