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
    band = Band.new(band_params)
    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] = "Was not able to add it to the screen"
      render :new
    end
  end

  def edit

  end

  def show
    begin
      @band = Band.find(params[:id])
      @albums = @band.albums
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
  def band_params
    params.require(:band).permit(:name)
  end

end
