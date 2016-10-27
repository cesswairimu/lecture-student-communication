require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  
  test "unsuccessful sign up" do
    get new_user_path
   assert_template 'users/new'
   assert_no_difference 'User.count' do
    post_via_redirect users_path user: { reg: "6787788", f_name: "ces", l_name: "wai",
                                         password: "foobar", password_confirmation: "barfoo"}
   end
 assert_template 'users/new'
   end
end
