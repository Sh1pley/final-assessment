Rails.application.routes.draw do
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: "links#index"
  
  resources :links, only: [:index]
  resources :users

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
