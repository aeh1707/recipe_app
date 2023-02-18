class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :prep_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cook_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: [true, false]
  has_many :recipe_foods
  belongs_to :user
  has_many :foods, through: :recipe_foods

  def total_price
    total = 0
  end
end
