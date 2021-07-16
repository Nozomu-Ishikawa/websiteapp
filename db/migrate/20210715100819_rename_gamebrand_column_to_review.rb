class RenameGamebrandColumnToReview < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :gamebrand, :game_brand
  end
end
