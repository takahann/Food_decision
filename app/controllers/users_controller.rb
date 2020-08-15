class UsersController < ApplicationController
  def index
  	@users = User.all
    @search = Recipe.ransack(params[:q])
    @search_recipes = @search.result
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
