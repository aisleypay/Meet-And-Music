class Api::V1::InstrumentsController < ApplicationController
  # before_action :authorize_user!

  def create
    instrument = Instrument.find_or_create_by(params)
    render json: instrument
  end
end
