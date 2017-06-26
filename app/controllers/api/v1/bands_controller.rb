class Api::V1::BandsController < ApplicationController
  # before_action :authorize_user!

  def index
    bands = Band.all
    render json: bands
  end

  def new
  end

  def create
    band = Band.create(band_params)
    render json: band
  end

  def show
    band = Band.find(params[:id])
    render json: band
  end

  def edit
  end

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
    Artist.recommendedArtists(coordinates, radius, band_genres, instruments_needed)
  end

  private

  def artist_params
    params.require(:artist).permit(:id,
                                   :name,
                                   :username,
                                   :password,
                                   :state,
                                   :zipcode,
                                   :setList,
                                   :genres_attributes => [:name]
                                  )
  end
end
