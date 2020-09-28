class FoodsController < ApplicationController
  
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    restaurant = Restaurant.find(current_restaurant.id)
    @foods = restaurant.foods
  end

  def create
    @food = Food.create(food_params)
    if @food.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to action: :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to action: :new
  end

  private
  def food_params
    params.require(:food).permit(:name, :price, :comment).merge(restaurant_id: current_restaurant.id)
  end

end