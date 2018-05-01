###################################################################
# session_index GET    /session(.:format)          session#index
#               POST   /session(.:format)          session#create
#   new_session GET    /session/new(.:format)      session#new
#  edit_session GET    /session/:id/edit(.:format) session#edit
#       session GET    /session/:id(.:format)      session#show
#               PATCH  /session/:id(.:format)      session#update
#               PUT    /session/:id(.:format)      session#update
#               DELETE /session/:id(.:format)      session#destroy
###################################################################

class SessionController < ApplicationController
  def index
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password])
      # ses_params[:email],ses_params[:password])

    if @user
      redir_to(@user)
    else
      @user = User.new(ses_params)
      flash.now[:errors] = ["Login failed."]
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    logout
  end

  def ses_params
    params.require(:user).permit(:email, :password)
  end



end
