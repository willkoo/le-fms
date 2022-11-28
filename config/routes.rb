Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :profiles

  resources :company_profiles do
    resources :company_comments, only: [:index, :show, :new, :create]
  end

  resources :licences do
    get "quiz/:quiz_id", to: 'quizzes#do_something', as: :licence_quiz
    resources :licence_comments, only: [:index, :show, :new, :create]
  end

  resources :franchises do
    resources :quizzes, only: [:index, :show, :new, :create]
  end

  # resources :quiz_attempts, only: [:new, :create, :index, :show]
  # resources :quiz_questions, only: [:new, :create, :index, :show]
  # resources :quiz_answers, only: [:new, :create, :index, :show]
end
