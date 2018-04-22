class CatsController < ApplicationController

def index
  @cats = Cat.all
end

def show
  @cat = Cat.find(params[:id])
end

def new
  @cat = Cat.new
  render :new
end

def create

  new_cat = Cat.new(cat_params)
  new_cat.birth_date = Date.today

  if new_cat.save
    redirect_to cat_url(new_cat)
  else
    flash[:errors] = 'Cat creation error!'
    redirect_to new_cat_url
  end
end

def edit
  @cat = Cat.find(params[:id])
  render :edit
end

private
def cat_params
  params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
end


end
