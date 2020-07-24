class ChefIngredientsController < ApplicationController
  def index
    # I am not a huge fan of this method but am struggling to figure out how to get around the nested iteration
    chef = Chef.find(params[:chef_id])
    @ingredients = []
    chef.dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        @ingredients << ingredient
      end
    end
  end
end
