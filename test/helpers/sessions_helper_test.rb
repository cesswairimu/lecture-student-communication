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
  

end
