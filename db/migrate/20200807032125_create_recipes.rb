class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :food_stuff, null: false
      t.text :procedure, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
