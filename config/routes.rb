PhotoOverflow::Application.routes.draw do
  resources :users
  root :to => "questions#new"
  resources :questions do
    resources :answers do
      resources :comments
    end
    resources :comments
  end
end
