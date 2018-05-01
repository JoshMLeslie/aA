class CatRentalRequestsController < ApplicationController

  def new
    render :new
  end

  def create
    render json: cat_rental_params
  end



  private
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id)
  end


end
