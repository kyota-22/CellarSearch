class DrinksController < ApplicationController

  def index
    @drinks = Drink.all
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.create(name: drink_params[:name], price: drink_params[:price], comment: drink_params[:comment])
  end

  private
  def drink_params
    params.require(:drink).permit(:name, :price, :comment)
  end

end