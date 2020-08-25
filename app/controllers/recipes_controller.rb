class RecipesController < ApplicationController
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
    @recipe.user_id = current_user.id
    if @recipe.save
     redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end
  def search
  end
  def index
    @recipes = Recipe.all.page(params[:page]).per(8)
    @recipe = Recipe.offset(rand(Recipe.count)).first(3)
    @user = current_user
    if params[:tag_name]
      @recipes = Recipe.tagged_with("#{params[:tag_name]}").page(params[:page]).per(8)
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
    if @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
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
end
