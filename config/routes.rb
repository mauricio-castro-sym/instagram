Rails.application.routes.draw do
  get 'pages/index'
  resources :comments
  devise_for :accounts, :controllers => { :registrations => :registrations }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "accounts#show"
  resources :pages, only: :index
  #get "/accounts", to: "accounts#home"
  #get "/accounts/:id", to: "accounts#home"
  resources :accounts, except: [:index, :new] do
    resources :posts do
      resources :comments
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
