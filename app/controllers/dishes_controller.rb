class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def index
  end
end
