Rails.application.routes.draw do
  get 'incoming/create'

  devise_for :users

  resources :users
  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks, except: :index

  post :incoming, to: 'incoming#create'

  get 'welcome/index'

  get 'welcome/about'

  root 'topics#index'
end
