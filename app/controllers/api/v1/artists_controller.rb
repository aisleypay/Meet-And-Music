class Api::V1::ArtistsController < ApplicationController
  before_action :authorize_user!, only: %i[create update destroy]

  def index
    artists = Artist.all
    render json: artists
  end

  def new; end

  def create
    pry
    artist = Artist.find_or_create_by(artist_params)
    render json: artist
  end

  def show
    artist = Artist.find(params[:id])
    render json: artist
  end

  def edit; end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    render json: artist
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    render json: artist
  end

  def recommendedBands
    artist = Artist.find(params[:id])
    artist_coor = [artist.latitude, artist.longitude]
    artist_instruments = artist.instruments.collect(&:name)
    artist_genres = artist.genres.collect(&:name)
    recommendations = Band.recommendedBands(artist_coor,
                                            artist.radius_preference,
                                            artist_instruments,
                                            artist_genres)
    render json: recommendations
  end

  def searchArtists
    searched_artists = Artist.search_artists(request.headers[:zipcode],
                                            request.headers[:radius],
                                            request.headers[:instrument],
                                            request.headers[:genre]
                                            )
    render json: searched_artists
  end

  private

  def artist_params
    params.require(:artist).permit(:id,
                                   :name,
                                   :state,
                                   :zipcode,
                                   :age,
                                   :setList,
                                   :experience_in_years,
                                   :radius_preference,
                                   user_genres_attributes: %i[id genre_id],
                                   artist_instruments_attributes: %i[id instrument_id name],
                                   user_attributes: %i[id username password])
  end
end
