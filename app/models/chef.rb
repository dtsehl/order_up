class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def most_popular_ingredients
    # I think I was on the right track here, but need to change my ActiveRecord query
    @ingredients = Ingredient.select("name").joins(:dish_ingredients).group(:ingredient_id).order("ingredient_id desc").limit(3)
  end
end
