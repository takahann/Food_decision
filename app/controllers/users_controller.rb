class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all.order(id: "DESC").page(params[:page]).per(8)
    @recipe = Recipe.find(Review.group(:recipe_id).order('count(recipe_id) desc').limit(5).pluck(:recipe_id))
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(8)
  end

  def post_list
    @user = User.find(params[:id])
  end

  def like_list
    @user = User.find(params[:id])
    @recipes = @user.recipes
    likes = Like.where(user_id: current_user.id).pluck(:recipe_id)
    @like_list = Recipe.find(likes)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新が完了しました。'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user = current_user
    @user.destroy
    redirect_to root_path, noticie: '退会が完了しました。'
    else
    render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:alert] = "権限がありません。"
      redirect_to root_path
    end
  end
end
