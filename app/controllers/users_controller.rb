class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      log_in  @user
      flash[:success] = "Welcome to Lecture Student Web Application"
      redirect_to @user
    else
      flash[:danger] = "Loser!!! Check your input and try again!!" 
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if  @user.update_attributes(params_user)
      flash[:success] = "Your Profile was updated successfully!!!"
      redirect_to @user
    else
      flash[:danger] = "Error editing profile, if you exit your previous details remain"
      render 'edit'
    end
  end
  def destroy
    logout
    redirect_to root_url
  end

  private
  def params_user
    params.require(:user).permit(:reg,:f_name,:l_name, :phone, :email, :password, :password_confirmation)
  end
end
