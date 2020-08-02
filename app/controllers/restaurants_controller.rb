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
    # @restaurant = current_restaurant
    # @drinks = current_restaurant.drinks
    restaurant = Restaurant.find(params[:id])
    @restaurants = restaurant
    @drinks = restaurant.drinks
  end

  def edit
  end

  def update
  end
  
  
  
end
