Rails.application.routes.draw do
  root 'items#index'

  get '/signup' => 'customers#new'
  post '/customers' => 'customers#create'

  get '/signin' => 'session#new'
  post '/signin' => 'session#create'
  get '/signout' => 'session#destroy'
end
