class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user
  has_many :recipes, through :recipe_foods
end
