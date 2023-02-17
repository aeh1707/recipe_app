Rails.application.routes.draw do
  devise_for :users
  rresources :recipes do
    resources :recipe_foods, only: [:new, :create]
  end
  resources :foods                                                                             
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes
  # Defines the root path route ("/")
  root "foods#index"
end
