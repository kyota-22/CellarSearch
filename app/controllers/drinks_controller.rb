class DrinksController < ApplicationController

  def index
    @drinks = Drink.all
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.create(drink_params)
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :price, :comment).merge(restaurant_id: current_restaurant.id)
  end

end