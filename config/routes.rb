Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'profiles', to: 'profiles#index'
  get 'profiles/:id', to: 'profiles#show'

  get 'profiles/new', to: 'profiles#new'
  post 'profiles/:id', to: 'profiles#create'

  get 'profiles/:id/edit', to: 'profiles#edit'
  patch 'profiles/:id', to: 'profiles#update'

  delete 'profiles', to: 'profiles#destroy'

end
