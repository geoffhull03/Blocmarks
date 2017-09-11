Rails.application.routes.draw do
  get 'users/show'

  get 'incoming/create'

  devise_for :users

  resources :users
    resources :users, only: [:show]
  resources :topics do
    resources :bookmarks, except: :index
      resources :likes, only: [:index, :create, :destroy]
  end



  post :incoming, to: 'incoming#create'

  get 'welcome/index'

  get 'welcome/about'

  root 'topics#index'
end
