class UsersController < ApplicationController

  before_action :current_user?

  def current_user?
    redirect_to cats_url if logged_in?
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user ||= User.new(user_params)
    if @user.save
      login(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages

      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
