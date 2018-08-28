require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com")
    @recipe1 = @chef.recipes.build(name: 'Vegatable', description: 'Vegatable recipe')
    @recipe1.save
    @recipe2 = @chef.recipes.build(name: 'Meat', description: 'Meat recipe')
    @recipe2.save
  end
  
  test "Страница с тестами должна открываться" do
    get recipes_url
    assert_response :success
  end
  
  test 'На странице index должны появиться тестовые рецепты' do
    get recipes_path
    assert_template 'recipes/index'
    assert_select 'a[href=?]', recipe_path(@recipe1), text: @recipe1.name
    assert_select 'a[href=?]', recipe_path(@recipe2), text: @recipe2.name
  end
  
  test 'На странице show должна появиться инормация о рецепте' do
    get recipe_path(@recipe1)
    assert_template 'recipes/show'
    assert_match @recipe1.name, response.body
    assert_match @recipe1.description, response.body
    assert_match @chef.chefname, response.body
  end
  
  
end
