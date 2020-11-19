Rails.application.routes.draw do
  get  'new_session',   to: 'sessions#new'
  post 'login',         to: 'sessions#login'
  get  'logout',        to: 'sessions#destroy'

  resources :messages do
    member do
      patch :hide
      put :hide
    end
  end
  root to: "messages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
