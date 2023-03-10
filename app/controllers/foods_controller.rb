class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.where(user: current_user)
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url(current_user), notice: 'Food was successfully created.' }
        # format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit, :quantity, :user_id)
  end
end
