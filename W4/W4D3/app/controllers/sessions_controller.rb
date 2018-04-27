class SessionsController < ApplicationController
    before_action :play_with_cats?, except: :destroy # redir to cats if user is logged on

    def new
      @user = User.new # passing in blank user for generalized form filling
      render :new
    end

    def create
      @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
      )

      if @user
        login(@user)
        redirect_to cats_url
        # after login, go to cats homepage
      else
        @user = User.new(username: params[:user][:username])

        flash[:errors] = ["Bad credentials!"]

        render :new
      end
    end


    def destroy
      logout
      redirect_to new_session_url
    end

end
