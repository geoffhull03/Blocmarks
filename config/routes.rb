Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :topics
  resources :bookmarks

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
