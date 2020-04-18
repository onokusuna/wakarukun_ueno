class ClipsController < ApplicationController
  def create
  	exhibition = Exhibition.find(params[:exhibition_id])
  	clip = current_user.clips.new(exhibition_id: exhibition.id)
    if clip.save
  	  flash[:notice] = "クリップしました。"
  	  redirect_back(fallback_location: root_path)
  	else
  	  flash[:notice] = "クリップに失敗しました。"
  	  redirect_to root_path
    end
  end

  def destroy
  	exhibition = Exhibition.find(params[:exhibition_id])
  	clip = current_user.clips.find_by(exhibition_id: exhibition.id)
  	if clip.destroy
  	  flash[:notice] = "クリップを外しました。"
  	  redirect_back(fallback_location: root_path)
  	else
  	  flash[:notice] = "クリップを外すのに失敗しました。"
  	  redirect_to root_path
    end
end

  private
  def clip_params
  	params.require(:clip).permit(:user_id, :exhibition_id)
  end
end