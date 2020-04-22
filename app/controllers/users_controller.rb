class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @clip = current_user.clips.includes(:exhibition).page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	if current_user.update(user_params)
      flash[:success] = "登録情報が変更されました。"
  	  redirect_to user_path(current_user)
  	else
      flash[:danger] = "登録情報の変更に失敗しました。"
  	  render "edit"
  	end
  end

  def active_leave
    if current_user.update(status: "Deleted")
      reset_session
      flash[:success] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    else
      flash[:danger] = "退会に失敗しました。"
      redirect_to user_path(current_user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end