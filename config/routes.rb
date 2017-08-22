Rails.application.routes.draw do
  #get 'topics/index'

  #get 'topics/show'

  #get 'topics/new'

  #get 'topics/edit'

  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  resources :users
  resources :topics

  root 'welcome#index'
end
