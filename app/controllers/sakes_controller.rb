class SakesController < ApplicationController
  def new
    @sake = Sake.new
    restaurant = Restaurant.find(current_restaurant.id)
    @sakes = restaurant.sakes
  end

  def create
    @sake = Sake.create(sake_params)
    if @sake.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to action: :new
    end
  end

  def destroy
    @sake = Sake.find(params[:id])
    @sake.destroy
    redirect_to action: :new
  end

  private
  def sake_params
    params.require(:sake).permit(:name, :price, :comment, :prefecture).merge(restaurant_id: current_restaurant.id)
  end
end
