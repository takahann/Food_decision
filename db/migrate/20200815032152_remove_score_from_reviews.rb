class RemoveScoreFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :score, :float
  end
end
