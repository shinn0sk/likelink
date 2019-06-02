Rails.application.routes.draw do
  get '/login',to: 'session#new'
  post '/login',to: 'session#create'
  delete '/logout',to: 'session#destroy'

  namespace :admin do
    resources :users
  end
  root to: 'posts#index'
  resources :posts
end
