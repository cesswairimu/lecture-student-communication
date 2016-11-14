class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      remember user
      params[:session][:remember_me] == '1'? remember(user) :forget(user)
      redirect_to user
    else
      flash[:danger] = "There was an error with your login"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end

end
