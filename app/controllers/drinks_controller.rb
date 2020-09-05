class DrinksController < ApplicationController

  def new
    @drink = Drink.new
    restaurant = Restaurant.find(current_restaurant.id)
    @drinks = restaurant.drinks
  end

  def create
    @drink = Drink.create(drink_params)
    redirect_to action: :new
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :price, :comment).merge(restaurant_id: current_restaurant.id)
  end

end