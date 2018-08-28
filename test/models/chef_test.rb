require 'test_helper'
class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: 'Vegatable', email: 'chef@gmail.com')
  end 
  
  test 'повор должен быть валидным' do
    assert @chef.valid?
  end
  
  test 'имя повора должно существовать' do
    @chef.chefname = ' '
    assert_not @chef.valid?
  end
  
  
  test 'Имя должно быть не более 50 символов' do
    @chef.chefname = 'a' * 51
    assert_not @chef.valid?
  end
  
  test 'почта повора должно существовать' do
    @chef.email = ' '
    assert_not @chef.valid?
  end
  
  test 'Почта не должна быть длинной' do
    @chef.email = "#{'a' * 193}@test.ru"
    assert_not @chef.valid?
  end
  
  test 'Почта должна быть правильного формата' do
    @chef.email = 'gggg.it'
    assert_not @chef.valid?
  end
  
  test 'Почта не должна быть в чёрном списке' do
    @chef.email = 'test@test.ru'
    assert_not @chef.valid?
  end
  
  test 'ChefName должен быть уникальным с учётом регистра' do
    # Chef.delete_all if Chef.count > 0
    Chef.create(chefname: 'chefname', email: 'chefname@chef.ru')
    @chef.chefname = 'ChefName'
    assert_not @chef.valid?
  end
  
end  