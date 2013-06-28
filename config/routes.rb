PhotoOverflow::Application.routes.draw do
  root :to => "questions#index"

  resources :users

  resources :questions do
    resources :answers
  end

  resources :questions, only: [] do
    resources :comments
    resources :votes
  end

  resources :answers, only: [] do
    resources :comments
  end

  get '/login'   => 'sessions#new'
  post '/login'  => 'sessions#create'
  get '/logout'  => 'sessions#destroy'
  get '/signup'  => 'users#new'
  post '/signup' => 'users#create'
end
