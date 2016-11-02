module SessionsHelper
  def login_user(user)
    session[:user_id]= user_id
  end
  def current
    @current ||= User.find_by(session: [:user_id])
  end
  def logged_in?
    !current.nil?
  end
end
