require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  it 'shows item info' do
    chef_1 = Chef.new(name: "Gordon Ramsay")
    dish_1 = chef_1.dishes.new(name: "Beef Wellington", description: "Amazing")
    ingredient_1 = Ingredient.new(name: "Wild Mushrooms", calories: 100)
    ingredient_2 = Ingredient.new(name: "Beef Fillet", calories: 500)
    visit "dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_1.calories)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_2.calories)
    expect(page).to have_content(chef_1.name)
  end
end
