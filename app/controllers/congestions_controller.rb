class CongestionsController < ApplicationController
  def create
    exhibition = Exhibition.find(params[:exhibition_id])
  	congestion = current_user.congestions.new(congestion_params)
    if congestion.save
  	  redirect_back(fallback_location: root_path)
    else
      redirect_to root_path
      flash[:danger] = "混雑度の投稿に失敗しました。"
    end
  end

  private
  def congestion_params
  	params.permit(:user_id, :exhibition_id, :condition)
  end
end
