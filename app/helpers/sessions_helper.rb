module SessionsHelper
  def login(user)
    session[:user_id]= user.id
  end
  def current
    if (user_id =session[:user_id])
      @current ||= User.find_by(id: session[:user_id])
    elsif (user_id =cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        login user
        @current = user
      end
    end
  end

  def logged_in?
    !current.nil?
  end
  def logout
    session.delete(:user_id)
    @current = nil
  end
  def remember(user)
    user.remember
    cookies.permamnet.signed[:user_id] = user.id
    cookies.permamnet[:remember_token] = user.remember_token
  end
end
