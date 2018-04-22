class SessionsController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end


  def create
    @user = User.find_by_credential(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ["Bad Login, Bob."]
      render :new
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
