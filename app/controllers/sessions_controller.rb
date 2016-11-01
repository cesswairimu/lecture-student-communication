class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(reg: params[:session][:reg])
    if user && user.authenticated(params[:session][:password])
    else
      flash[:danger] = "There was an error with your login"
      render 'new'
    end
  end
end
