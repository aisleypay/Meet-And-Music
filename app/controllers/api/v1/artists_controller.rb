class Api::V1::ArtistsController < ApplicationController
  # before_action :authorize_user!

  def index
    artists = Artist.all
    render json: artists
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)
    render json: artist
  end

  def show
    artist = Artist.find(params[:id])
    render json: artist
  end

  def edit
  end

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

  private

  def artist_params
    params.require(:artist).permit(:id,
                                   :name,
                                   :username,
                                   :password,
                                   :state,
                                   :zipcode,
                                   :age,
                                   :setList,
                                   :experience_in_years,
                                   :genres_attributes => [:name],
                                   :instruments_attributes => [:name]
                                  )
  end
end
