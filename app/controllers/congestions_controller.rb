class CongestionsController < ApplicationController
  def create
    exhibition = Exhibition.find(params[:exhibition_id])
  	congestion = current_user.congestions.new(congestion_params)
    congestion.save
  	redirect_back(fallback_location: root_path)
  end

  private
  def congestion_params
  	params.permit(:user_id, :exhibition_id, :condition)
  end
end
