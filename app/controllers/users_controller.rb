class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  	if current_user.update(user_params)
  	   redirect_user_path(current_user)
  	else
  	   redirect_root_path
  	end
  end

  def active_leave
    if current_user.update(status: "Deleted")
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
    else
      flash[:notice] = "退会に失敗しました。"
      redirect_to user_path(current_user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end