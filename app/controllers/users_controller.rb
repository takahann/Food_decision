class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
