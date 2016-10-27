require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home | Lecturer Student Feedback"
  end
  test "should get signup" do
    get new_user_path
    assert_response :success
    assert_select "title", "Signup | Lecturer Student Feedback"
  end


end
