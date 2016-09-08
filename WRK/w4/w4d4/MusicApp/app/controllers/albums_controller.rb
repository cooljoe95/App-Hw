class AlbumsController < ApplicationController

  def new
    @album = Album.new
    # debugger
    @album.band_id = params[:band_id]
    render :new
  end

  def create
    album = Album.new(album_params)
    # debugger
    if album.save
      redirect_to album_url(album.id)
    else
      render :new
    end
  end

  def edit

  end

  def edit

  end

  def show
    begin
      @album = Album.find(params[:id])
      render :show
    rescue
      redirect_to bands_url
    end
  end

  def update

  end

  def destroy

  end

  private
  def album_params
    params.require(:album).permit(:album_name, :album_type, :band_id)
  end

end
