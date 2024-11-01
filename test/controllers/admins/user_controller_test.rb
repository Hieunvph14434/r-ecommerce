require "test_helper"

class Admins::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_user_index_url
    assert_response :success
  end
end
