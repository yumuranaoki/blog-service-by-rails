Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/posts', to: 'posts#index'
  post '/posts', to: 'posts#create'
  get '/post/:id', to: 'posts#show'
  post '/signup', to: 'users#create'
  patch '/user', to: 'users#update'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
