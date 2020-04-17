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

  def leave
  end

  def thanks
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end