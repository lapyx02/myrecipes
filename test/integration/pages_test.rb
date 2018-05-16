require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  test 'Открытие страницы home' do
    get pages_home_url
    assert_response :success 
  end
  test 'Открытие главной страницы' do 
    get root_url
    assert_response :success
  end  
  # test "the truth" do
  #   assert true
  # end
end
