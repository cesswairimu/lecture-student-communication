module SessionsHelper
  def login_user(user)
    session[:user_id]= user_id
  end
end
