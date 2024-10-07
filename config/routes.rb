Rails.application.routes.draw do
  # Defina primeiro o Devise Token Auth para evitar conflitos
  mount_devise_token_auth_for 'User', at: 'auth'
  # Defina suas rotas personalizadas depois
  resources :users, only: [:index]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
