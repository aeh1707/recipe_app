class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, comparison: { greater_than_or_equal_to: 0 }
  validates :measurement_unit, presence: true
  validates :quantity, comparison: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :recipe_food
  belongs_to :user
end
