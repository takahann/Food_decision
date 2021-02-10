class HomesController < ApplicationController
  def about
  end

  def top
    @recipe = Recipe.all.sample(3)
    @recipes = Recipe.order(created_at: :desc).limit(3)
    @ranking = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end
end
