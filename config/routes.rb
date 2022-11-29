Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles
  resources :approved_franchises
  resources :trainings, only: %i[index show]

  resources :company_profiles do
    resources :company_comments, only: [:index, :show, :new, :create]
  end

  resources :licences do
    resources :licence_comments, only: [:index, :show, :new, :create]
  end

  resources :franchises do
    resources :quizzes, only: %i[show]
  end

  resources :quizzes, only: %i[index new create] do
    resources :quiz_questions, only: [:new, :create, :index]
  end

  resources :quiz_attempts, only: [:index, :show, :new, :create]
  resources :quiz_answers, only: [:new, :create, :index, :show]
  resources :quiz_options, only: [:new, :create, :index, :show]
end
