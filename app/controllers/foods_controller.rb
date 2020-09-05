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
    redirect_to action: :new
  end

  private
  def food_params
    params.require(:food).permit(:name, :price, :comment).merge(restaurant_id: current_restaurant.id)
  end

end