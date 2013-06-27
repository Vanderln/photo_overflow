PhotoOverflow::Application.routes.draw do
  root :to => "questions#new"
  resources :questions do
    resources :answers do
      resources :comments
    end
    resources :comments
  end
end
