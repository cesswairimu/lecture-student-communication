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
assert_template 'users/edit'
patch user_path(@user), params: {
user: {
    reg: "ci/00050/203", f_name: "betty", l_name:"Cessy", phone:032425542, 
            email:"betty@gmail.com",  password: "foobar", password_confirmation: "foobar" }
      }
assert_redirected_to @user
assert_not flash.empty?
end

end
