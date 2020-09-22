class ReviewsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.recipe_id = recipe.id
    review.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    review = Review.find_by(id: params[:id], recipe_id: params[:recipe_id])
    if review.user = current_user
    review.destroy
    redirect_to recipe_path(params[:recipe_id])
    else
    render "recipe/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate)
  end
end
