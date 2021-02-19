class RemoveProcedureFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :procedure, :text
  end
end
