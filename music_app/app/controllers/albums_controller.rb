class AlbumsController < ApplicationController
  def index
    if params[:band_id]
      @bands = [Band.includes(:albums).find_by(id: params[:band_id])]
    else
      @bands = Band.all
    end
    render :index
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to bands_url
    else
      falsh.now['errors'] = @ablum.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to band_albums_url(band_id: @album.band_id)
    else
      falsh.now['errors'] = @ablum.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    band_id = @album.band_id
    if @album.destroy
      redirect_to band_albums_url(band_id: band_id)
    else

    end
  end

  private

  def album_params
    params.require(:album).permit([:band_id, :title, :year, :live])
  end
end
