require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get id:integer" do
    get user_id:integer_url
    assert_response :success
  end

  test "should get email:string" do
    get user_email:string_url
    assert_response :success
  end

  test "should get password:string" do
    get user_password:string_url
    assert_response :success
  end

end
