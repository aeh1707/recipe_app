class GeneralShoppingListsController < ApplicationController
    def index
        @recipes = current_user.recipes
        @recipe_missing_foods = []
        @missing_foods_price = 0
        @missing_foods_count = 0

        @recipes.each do |recipe|
            @recipe_missing_foods.concat(recipe.missing_foods[:list])
            @missing_foods_price += recipe.missing_foods[:total_price]
            @missing_foods_count += recipe.missing_foods[:count]
        end
    end
end