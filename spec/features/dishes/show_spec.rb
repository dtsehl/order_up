require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  it 'shows dish info' do
    chef_1 = Chef.create!(name: "Gordon Ramsay")
    dish_1 = chef_1.dishes.create!(name: "Beef Wellington", description: "Amazing")
    ingredient_1 = Ingredient.create!(name: "Wild Mushrooms", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Beef Fillet", calories: 500)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

    visit "dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_1.calories)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_2.calories)
    expect(page).to have_content(chef_1.name)
  end

  it "totals the calorie count for all ingredients in a dish" do
    chef_1 = Chef.create!(name: "Gordon Ramsay")
    dish_1 = chef_1.dishes.create!(name: "Beef Wellington", description: "Amazing")
    ingredient_1 = Ingredient.create!(name: "Wild Mushrooms", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Beef Fillet", calories: 500)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

    visit "dishes/#{dish_1.id}"

    expect(page).to have_content("Total Calories: 600")
  end
end
