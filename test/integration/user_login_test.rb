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
    delete logout_path
    assert_not logged_in?
    assert_redirected_to root_url
    delete logout_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0 


  end
  test "login with remembering" do
    login_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end
  test "login without remembering" do
    login_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
