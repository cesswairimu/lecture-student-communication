module SessionsHelper
  def login(user)
    session[:user_id]= user_id
  end
  def current
    @current ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current.nil?
  end
  def logout
    session.delete(:user_id)
    @current = nil
  end
end
