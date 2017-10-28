class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      redirect_to bands_url
    else
      render :edit
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      redirect_to bands_url
    end
  end

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band
      render :show
    else
      redirect_to bands_url
    end
  end

  private
  def band_params
    params.require(:band).permit([:name])
  end
end
