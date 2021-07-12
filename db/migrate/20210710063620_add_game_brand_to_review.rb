class AddGameBrandToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :game_brand, :integer, default: 0, after: :game_title
  end
end
