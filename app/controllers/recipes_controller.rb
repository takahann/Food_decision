class RecipesController < ApplicationController
  before_action :correct_recipe, only: [:edit, :update]

  def about
  end

  def top
    @recipes = Recipe.all.sample(4)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: '投稿が完了しました。'
    else
      render :new
    end
  end

  def search
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result.page(params[:page]).per(8)
    @recipe = Recipe.all.sample(4)
  end

  def index
    @recipes = Recipe.all.order(id: "DESC").page(params[:page]).per(8)
    @search = Recipe.ransack(params[:q])
    @recipe = Recipe.find(Review.group(:recipe_id).order('count(recipe_id) desc').limit(5).pluck(:recipe_id))
    if params[:tag_name]
      @recipes = Recipe.tagged_with("#{params[:tag_name]}").page(params[:page]).per(8)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
    @reviews = @recipe.reviews.page(params[:page]).per(5)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: '編集が完了しました。'
    else
      render :new
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :food_stuff,
      :image,
      :procedure,
      :tag_list
    )
  end

  def search_params
    params.require(:q).permit!
  end

  def correct_recipe
    @recipe = Recipe.find(params[:id])
    if @recipe.user != current_user
      flash[:alert] = "権限がありません。"
      redirect_to root_path
    end
  end
end
