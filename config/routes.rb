Rails.application.routes.draw do
  resources :users
  resources :recipes
  resources :foods
  resources :recipe_foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
