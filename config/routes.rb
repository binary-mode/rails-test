Rails.application.routes.draw do
  resources :messages
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#delete'
  get '/hide_message' => 'messages#hide_message'

  root to: "messages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
