Blog2015::Application.routes.draw do
  resources :users do
  	member do
      get :post
    end
  end
  resources :sessions, only:[:new, :create, :destroy]
  resources :posts do
    resources :replies, only: [:create, :index]
  end
  resources :replies, only: [:destroy]

  root to: 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

end
