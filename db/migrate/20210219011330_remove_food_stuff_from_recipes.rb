class RemoveFoodStuffFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :food_stuff, :string
  end
end
