class Api::V1::DecisionsController < ApplicationController
  before_action :authorize_user!

  def index
    decisions = Decision.all

    render json: decisions
  end
  def create
    decider = User.find_by_id(decision_params[:decider_attributes][:id])
    chosen = User.find_by_id(decision_params[:chosen_id].to_i)
    decision = Decision.create(decider: decider, chosen: chosen, status: decision_params[:status])
    render json: decision
  end

  private

  def decision_params
    params.require(:decision).permit(
      :id,
      :status,
      :chosen_id,
      decider_attributes: %i[id name state zipcode setList user_attributes]
    )
  end
end
