Rails.application.routes.draw do
  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create]
      resources :foods
    end
  end                                                                                
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
end
