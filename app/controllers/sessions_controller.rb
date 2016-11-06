class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash[:danger] = "There was an error with your login"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
