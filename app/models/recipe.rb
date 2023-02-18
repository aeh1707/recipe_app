class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :prep_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cook_time, comparison: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: [true, false]
  has_many :recipe_foods
  belongs_to :user
<<<<<<< HEAD

  def self.public_recipes
    where(public: true)
=======
  has_many :foods, through: :recipe_foods

  def missing_foods
    data = { list: [], count: 0, total_price: 0 }
    recipe_foods.includes(:food).each do |recipe_food|
      recipe_food_quantity = recipe_food.quantity
      food_available_quantity = recipe_food.food.quantity

      next unless (food_available_quantity.to_i - recipe_food_quantity.to_i).negative?

      data[:list] << recipe_food.food
      data[:count] += 1
      data[:total_price] += recipe_food.food.price
    end
    data
>>>>>>> 4b1887ff74819e270803283e6e582b77f5e7ddad
  end
end
