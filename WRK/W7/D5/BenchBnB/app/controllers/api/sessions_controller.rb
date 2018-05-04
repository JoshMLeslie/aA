class Api::SessionsController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    if logged_in?
      logout
      render json: {}
    else
      render json: "How did this happen?", status: 418
    end
  end
end
