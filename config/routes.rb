Rails.application.routes.draw do
  root 'items#index'

  get '/signup' => 'customers#new'
  post '/customers' => 'customers#create'
  get '/customers/:id', to: 'customers#show', as: 'customer'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
