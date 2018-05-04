class Api::UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render 'api/users/show'
    else
      render json: @user.errors.full_messages, status: 422
    end

    def show
      @user = User.find_by(params[:id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
