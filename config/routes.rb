Blog2015::Application.routes.draw do
  resources :users

  root to: 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'

end
