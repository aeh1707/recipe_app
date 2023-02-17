class RecipeFood < ApplicationRecord
  validates :quantity, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :recipes
  has_many :foods
end
