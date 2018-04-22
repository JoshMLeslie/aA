class SubsController < ApplicationController
  before_action :redirect_unless_logged_in

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ["SO MANY ERRORS. OH THE SUBMANITY"]
      render :new
    end

  end

  def show # sub_url => :id
    @params = params[:id]
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit # sub_url => :id
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update # sub_url => :id
    # allow only logged in user to edit their own subs
    @sub = current_user.subs.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ["SO MANY ERRORS. OH THE SUBMANITY"]
      render :edit
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end
