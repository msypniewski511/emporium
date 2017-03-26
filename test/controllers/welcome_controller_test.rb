require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_path
    assert_response :success  	
  end

  test "should get about" do
  	get about_path
  	assert_response :success
  end
end
