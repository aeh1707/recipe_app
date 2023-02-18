class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(user: current_user)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id].to_i)
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    @foods = Food.includes(:recipe_foods).where(recipe_foods: { id: @recipe_foods.pluck(:id) })
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @new_recipe = params.require(:recipe).permit(:name, :description, :prep_time, :cook_time, :public, :user_id)
    @recipe = Recipe.new(user: current_user, name: @new_recipe[:name], description: @new_recipe[:description],
                         prep_time: @new_recipe[:prep_time], cook_time: @new_recipe[:cook_time],
                         public: @new_recipe[:public])

    if @recipe.save
      flash[:success] = 'Recipe created succefully!'
    else
      flash[:error] = 'The recipe couldn\'t be created!'
    end
    redirect_to recipes_path
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.fetch(:recipe, {})
  end
end
