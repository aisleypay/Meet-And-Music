class Api::V1::BandsController < ApplicationController
  before_action :authorize_user!, only: %i[create update destroy]

  def index
    bands = Band.all
    render json: bands
  end

  def new; end

  def create
    band = Band.create(band_params)
    render json: band
  end

  def show
    band = Band.find(params[:id])
    render json: band
  end

  def edit; end

  def update
    band = Band.find(params[:id])
    band.update(band_params)
    render json: artist
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    render json: band
  end

  def searchArtists
    band = Band.find(params[:id])
    band_coor = [band.latitude, band.longitude]
    band_genres = band.genres.collect { |g| g.name }
    instruments_needed = band.band_instrument_preferences.collect { |i| Instrument.find_by_id(i.id).name }
    recommendations = Artist.recommendedArtists(band_coor,
                                                band.radius_preference,
                                                band_genres,
                                                instruments_needed)

    render json: recommendations
  end

  private

  def artist_params
    params.require(:band).permit(:id,
                                 :name,
                                 :state,
                                 :zipcode,
                                 :setList,
                                 genres_attributes: %i[id name],
                                 user_attributes: %i[id username password])
  end
end
