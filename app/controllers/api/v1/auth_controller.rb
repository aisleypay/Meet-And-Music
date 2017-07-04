class Api::V1::AuthController < ApplicationController
  # before_action :authorize_user!, only: [:create]

  def index
    users = User.all
    render json: users
  end

  def show
    if current_user.meta_type === 'Band'
      render json: {
        id: current_user.id,
        username: current_user.username,
        meta_type: current_user.meta_type,
        user_info: current_user.meta,
        user_genres: current_user.meta.genres
      }
    else
      render json: {
        id: current_user.id,
        username: current_user.username,
        meta_type: current_user.meta_type,
        user_info: current_user.meta,
        user_genres: current_user.meta.genres,
        user_instruments: current_user.meta.instruments
      }
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      if user.meta_type === 'Band'
      render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({ user_id: user.id }, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM']),
        meta_type: user.meta_type,
        user_info: user.meta,
        user_genres: user.meta.genres
      }
      else
        render json: {
          id: user.id,
          username: user.username,
          jwt: JWT.encode({ user_id: user.id }, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM']),
          meta_type: user.meta_type,
          user_info: user.meta,
          user_genres: user.meta.genres,
          user_instruments: user.meta.instruments
        }
      end
    else
      render json: {
        error: 'Username or password incorrect'
      }, status: 404
    end
  end
end
