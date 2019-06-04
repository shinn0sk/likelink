class Admin::UsersController < ApplicationController
  before_action :user_setup, only: [:edit,:update,:destroy]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path

    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end


  def update
    
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end

  end

  def destroy
    
    @user.destroy
    redirect_to admin_users_path
  end




  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_setup
    @user = User.find(params[:id])

    unless current_user.admin? || @user == current_user
      redirect_to admin_users_path
    end
  end

    

end
