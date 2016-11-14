require 'test_helper'
class SessionHelperTest < ActionView::TestCase
  def setup
    @user = users(:betty)
    remember @user
  end

  test "current returns right user when session is nil" do
    assert_equal @user, current
    assert logged_in?
  end


  test "return current if session is remember digest is nil" do
    @user.update_attrribute(:remember_digest, User.digest(User.token))
    assert_nil current
  end
end
