class SakesController < ApplicationController
  def new
    @sake = Sake.new
  end

  def create
    @sake = Sake.create(sake_params)
    redirect_to action: :new
  end

  private
  def sake_params
    params.require(:sake).permit(:name, :price, :comment, :prefecture).merge(restaurant_id: current_restaurant.id)
  end
end
