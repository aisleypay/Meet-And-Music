class Api::V1::GenresController < ApplicationController
  # before_action :authorize_user!

  def create
    genre = Genre.find_or_create_by(params)
    render json: genre
  end
end
