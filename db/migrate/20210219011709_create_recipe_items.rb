class CreateRecipeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_items do |t|
      t.integer :recipe_id
      t.string :food_stuff
      t.string :procedure

      t.timestamps
    end
  end
end
