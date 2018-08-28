require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com")
    @recipe = @chef.recipes.build(name: 'Vegatable', description: 'Vegatable recipe')
  end 
  
  test 'рецепт должен быть валидным' do
    assert @recipe.valid?
  end
  
  test 'имя рецепта должно существовать' do
    @recipe.name = ' '
    assert_not @recipe.valid?
  end
  
  test 'описание рецепта должно существовать' do
    @recipe.description = ' '
    assert_not @recipe.valid?
  end
  
  test 'Описание должно быть больше 5 символов' do
    @recipe.description = 'a' * 4
    assert_not @recipe.valid?
  end
  
  test 'Описание должно быть мение 500 символов' do
    @recipe.description = 'a' * 501
    assert_not @recipe.valid?
  end
  
  test 'Рецепт без шефа не может существовать' do
    @recipe.chef = nil
    assert_not @recipe.valid?
  end
end  