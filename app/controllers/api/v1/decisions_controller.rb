class Api::V1::DecisionsController < ApplicationController
  before_action :authorize_user!

  def create
    decider = User.find_by_id(decision_params['decider_id']).id
    chosen = User.find_by_id(decision_params['chosen_id']).id
    decision = Decision.create(decider_id: decider,
                               chosen_id: chosen,
                               status: decision_params['status'])
    render json: decision
  end

  private

  def decision_params
    params.require(:decision).permit(
      :id,
      :decider_id,
      :chosen_id,
      :status
    )
  end
end
