class RecipesController < ApplicationController
  def top
    @random = Recipe.order("RANDOM()").limit(1)
  end
  def new
  	@recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes = Recipe.all
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result
    if params[:tag_name]
      @recipes = Recipe.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
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
end
