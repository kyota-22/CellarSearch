class WinesController < ApplicationController
  def new
    @wine = Wine.new
    restaurant = Restaurant.find(current_restaurant.id)
    @wines = restaurant.wines
  end

  def create
    @wine = Wine.create(wine_params)
    if @wine.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to action: :new
    end
  end

  private
  def wine_params
    params.require(:wine).permit(:name, :price, :comment, :color, :area, :variety).merge(restaurant_id: current_restaurant.id)
  end
end
