Rails.application.routes.draw do
  root 'items#index'

  get '/signup' => 'customers#new'
  post '/customers' => 'customers#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
