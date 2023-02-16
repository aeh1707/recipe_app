Rails.application.routes.draw do
  resources :users do
    resources :recipes
    resources :foods, only: [:index]
  end                                                                                
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
end
