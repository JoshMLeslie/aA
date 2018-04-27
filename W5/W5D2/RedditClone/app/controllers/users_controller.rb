class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
  end
  #
  # def update
  # end
  #
  # def edit
  # end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    redirect_to new_user_url
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
