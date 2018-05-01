class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redir_to(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
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
  end

  def album_params
    params.require(:album).permit(:name)
  end
end
