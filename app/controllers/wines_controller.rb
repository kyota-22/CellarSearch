class WinesController < ApplicationController
  def new
    @wine = Wine.new
    restaurant = Restaurant.find(current_restaurant.id)
    @wines = restaurant.wines
  end

  def create
    @wine = Wine.create(wine_params)
    redirect_to action: :new
  end

  private
  def wine_params
    params.require(:wine).permit(:name, :price, :comment, :color, :area, :variety).merge(restaurant_id: current_restaurant.id)
  end
end
