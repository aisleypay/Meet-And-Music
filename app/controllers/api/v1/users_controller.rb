class Api::V1::UsersController < ApplicationController
  def show
    user= User.find(params[:id])
    render json: user
  end

  def reach_out
    @user = User.find(params[:id])
    UserMailer.reach_out(params[:recipient], @user).deliver
    render json: @user
  end
end
