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
    Review.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate)
  end
end
