class TracksController < ApplicationController
  def index
    if params[:band_id]
      @bands = [Band.includes(albums: :tracks).find_by(id: params[:band_id])]
    else
      @bands = Band.all.includes(albums: :tracks)
    end
  end

  def new
    @track = Track.new
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to tracks_url
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track.destroy
      redirect_to tracks_url
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to bands_url
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  private
  def track_params
    params.require(:track).permit([:album_id, :title, :ord, :lyrics, :regular])
  end
end
