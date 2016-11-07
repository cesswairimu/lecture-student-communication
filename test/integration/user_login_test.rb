require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:betty)
  end
  test "login a user if information is valid" do
get login_path
post login_path, session: {email: @user.email, password:'password'  }
assert_redirected_to @user
follow_redirect!
assert_template 'users/show'
assert_select "a[href=?]", login_path, count: 0
assert_select "a[href=?]", logout_path
assert_select "a[href=?]", user_path(@user)
  end
end
