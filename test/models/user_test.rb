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
  test "email should have a maximum of 30 characters " do
  @user.email = "a" * 31
  assert_not @user.valid?
end
  test "email should not be empty" do
    @user.email = " "
    assert_not  @user.valid?
  end
  test "email, reg and phone should be unique" do
  duplicate_user = @user.dup
  @user.save
  assert_not duplicate_user.valid?
end
  test "reg should be present" do
    @user.reg = " "
    assert_not @user.valid?
  end
  test "reg should not be longer than usual" do
    @user.reg = "a" * 15
    assert_not @user.valid?
  end

  test "phone should be numeric" do 
    @user.phone = "wepeople"
    assert_not @user.valid?
  end

  test "phone number should not be more than 13 characters" do
    @user.phone =  06634346346355555555555
    assert_not @user.valid?
  end

end
