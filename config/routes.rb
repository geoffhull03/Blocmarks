Rails.application.routes.draw do
  get 'incoming/create'

  devise_for :users

  resources :users
  resources :topics do
    resources :bookmarks, except: :index
      resources :likes, only: [:index, :create, :destroy]
  end



  post :incoming, to: 'incoming#create'

  get 'welcome/index'

  get 'welcome/about'

  root 'topics#index'
end
