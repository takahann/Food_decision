class UsersController < ApplicationController
  def index
  	@users = User.all.page(params[:page]).per(8)
    @user = current_user
    @recipes = Recipe.all.page(params[:page]).per(8)
    @recipe = Recipe.offset(rand(Recipe.count)).first(3)
  end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.all.page(params[:page]).per(8)
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
