class UsersController < ApplicationController
  def index
  	@users = User.all.page(params[:page]).per(8)
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
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
