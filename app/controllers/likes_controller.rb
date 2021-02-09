class LikesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    like = current_user.likes.build(recipe_id: params[:recipe_id])
    like.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    like = Like.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    like.destroy
  end
end
