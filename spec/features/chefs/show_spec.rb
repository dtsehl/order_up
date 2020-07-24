require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do
  it 'shows chef info' do
    chef_1 = Chef.create!(name: "Gordon Ramsay")
    dish_1 = chef_1.dishes.create!(name: "Beef Wellington", description: "Amazing")
    dish_2 = chef_1.dishes.create!(name: "Omlette", description: "Stupendous")
    ingredient_1 = Ingredient.create!(name: "Wild Mushrooms", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Beef Fillet", calories: 500)
    ingredient_3 = Ingredient.create!(name: "Eggs", calories: 200)
    ingredient_4 = Ingredient.create!(name: "Cheese", calories: 150)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_4.id)

    visit "chefs/#{chef_1.id}"

    expect(page).to have_content(chef_1.name)
    expect(page).to have_link("View all ingredients used in this chef's dishes")
    click_on "View all ingredients used in this chef's dishes"

    expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end

  it "displays the chef's three most popular ingredients" do
    chef_1 = Chef.create!(name: "Gordon Ramsay")
    dish_1 = chef_1.dishes.create!(name: "Beef Wellington", description: "Amazing")
    dish_2 = chef_1.dishes.create!(name: "Omlette", description: "Stupendous")
    dish_3 = chef_1.dishes.create!(name: "Baked Salmon", description: "Spectacular")
    ingredient_1 = Ingredient.create!(name: "Wild Mushrooms", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Beef Fillet", calories: 500)
    ingredient_3 = Ingredient.create!(name: "Eggs", calories: 200)
    ingredient_4 = Ingredient.create!(name: "Cheese", calories: 150)
    ingredient_5 = Ingredient.create!(name: "Salmon", calories: 400)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_4.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_4.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_5.id)

    visit "chefs/#{chef_1.id}"

    expect(page).to have_content("Three most popular ingredients:")
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_4.name)
  end
end
