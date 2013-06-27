PhotoOverflow::Application.routes.draw do
  root :to => "questions#index"

  resources :users

  resources :questions do
    resources :answers do
      resources :comments
    end
    resources :comments
  end

  get '/login'   => 'sessions#new'
  post '/login'  => 'sessions#create'
  get '/logout'  => 'sessions#destroy'
  get '/signup'  => 'users#new'
  post '/signup' => 'users#create'
end
