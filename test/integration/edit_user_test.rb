require 'test_helper'

class EditUserTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:betty)
  end
  test "Unsuccessful  edits for user details" do
    get edit_user_path(@user)
    assert_template 'users/edit'

    patch user_path(@user),
   params: { user: { reg: "ci/00050/203", f_name: "", l_name:"Cessy", phone:032425542, 
             password: "foobar", password_confirmation: "barfoo" }
    }
   assert_not flash.empty?
    assert_template 'users/edit'

   end

test "successful user edit" do
get edit_user_path(@user)
 #log_in_as(@user) 
#assert_redirected_to edit_user_path(@user)
l_name = "Foo Bar"
email = "foo@bar.com"
patch user_path(@user), user: {l_name:l_name,
email: email,
password:
"foobar",
password_confirmation: "foobar" }
assert_not flash.empty?
assert_redirected_to @user
@user.reload
assert_equal @user.l_name, l_name
assert_equal @user.email, email

end
end
