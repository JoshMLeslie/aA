class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.create(band_params)
    if @band.save
      redir_to(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
