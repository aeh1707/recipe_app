class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :prep_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cook_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: [true, false]
  has_many :recipe_foods
  belongs_to :user

  def self.public_recipes
    where(public: true)
  end
end
