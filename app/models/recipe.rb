class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :prep_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cook_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: [true, false]
  belongs_to :recipe_food
  belongs_to :user
end
