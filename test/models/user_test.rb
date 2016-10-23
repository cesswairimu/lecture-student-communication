require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(reg:"CI/00050/2013", f_name: "Felix", l_name:"Muik", email: "felix@gmail.com", phone: "0720778634" )
  end
  test "f_name and l_name should have minimum length" do
    @user.f_name = "a" * 2 || @user.l_name = "a" * 2
    assert_not  @user.valid?

  end
  test "l_name and f_name should not be empty" do
    @user.f_name = " "  || @user.l_name = " " 
    assert_not  @user.valid?
  end
end
