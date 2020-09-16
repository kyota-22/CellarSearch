class DrinksController < ApplicationController

  def new
    @drink = Drink.new
    restaurant = Restaurant.find(current_restaurant.id)
    @drinks = restaurant.drinks
  end

  def create
    @drink = Drink.create(drink_params)
    # drink.jsから送られてきたjson形式のリクエストに対してjson形式でレスポンスをする記述
    # (これによりビューファイルとしてjbuilder(create.json.jbuilder)のデータが返される)
    if @drink.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to action: :new
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to action: :new
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :price, :comment).merge(restaurant_id: current_restaurant.id)
  end

end