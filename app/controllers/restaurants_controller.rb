class RestaurantsController < ApplicationController
  
  def index
    # @search = Restaurant.search(params[:q])
    # @restaurants = @search.result
    # @drinks = Drink.includes(:restaurant)
    @q = Restaurant.all.ransack(params[:q])
    @restaurants = @q.result
  end

  def search
    @search = Restaurant.search(params[:q])
    @restaurants = @search.result
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    restaurant = Restaurant.find(params[:id])
    @restaurants = restaurant
    @drinks = restaurant.drinks
    @foods = restaurant.foods
    @sakes = restaurant.sakes
    @wines = restaurant.wines
  end

  def edit
  end

  def update
    current_restaurant.update(restaurant_params)
    redirect_to root_path
  end
  
  private
  def  restaurant_params
    params.require(:restaurant).permit(:name, :addres, :station, :tel, :image, :email, :comment)
  end

end
