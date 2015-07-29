Blog2015::Application.routes.draw do
  resources :users
  resources :sessions, only:[:new, :create, :destroy]

  root to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

end
