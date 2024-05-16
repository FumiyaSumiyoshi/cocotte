require "test_helper"

class CocotteControllerTest < ActionDispatch::IntegrationTest
  test "should get menu" do
    get cocotte_menu_url
    assert_response :success
  end
end
