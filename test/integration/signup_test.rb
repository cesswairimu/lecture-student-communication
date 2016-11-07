require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  
  test "unsuccessful sign up" do
    get new_user_path
   assert_template 'users/new'
   assert_no_difference 'User.count' do
    post users_path user: { reg: "6787788", f_name: "ces", l_name: "wai",
                                         password: "foobar", password_confirmation: "barfoo"}
   end
   
 assert_template 'users/new'
   end
  test "successful signup" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path user: {reg: "ed/ooo1/908", f_name: "student", l_name: "student", 
      email: "student@gmail.com", phone: "0720778637", password: "foobar",
      password_confirmation: "foobar"}
    end
    follow_redirect!
    assert_template 'users/show'
    assert logged_in?
  end
end
