Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks, except: :index

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
