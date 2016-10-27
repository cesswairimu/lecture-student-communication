class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end
  

  private
  def params_user
    params.require(:user).permit(:reg,:f_name,:l_name, :phone, :email, :password, :password_confirmation)
  end
end
