Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"

  post '/hello_sign', to: 'pages#hello_sign'
  get '/test', to: 'pages#test'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles
  resources :approved_franchises
  resources :trainings, only: %i[index show]

  resources :company_profiles do
    resources :company_comments, only: %i[index show new create]
  end

  post '/finish_quiz', to: 'quiz_attempts#complete', as: :finish_quiz

  resources :licences do
    resources :licence_comments, only: %i[index show new create]
    resources :quizzes do
      resources :quiz_attempts
    end
    get '/sign_contract', to: 'licences#sign_contract'
    get '/create_contract', to: 'licences#create_contract'
  end

  resources :franchises do
    resources :quizzes, only: %i[show]
  end

  resources :quizzes, only: %i[index new create] do
    resources :quiz_questions, only: %i[new create index]
    resources :quiz_attempts, only: %i[new create]
  end

  resources :quiz_attempts, only: %i[index show] do
    resources :quiz_answers, only: %i[new create]
  end

  resources :quiz_answers, only: %i[index show]
  resources :quiz_options, only: %i[new create index show]
end
