class AddGameBrandToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :gamebrand, :integer, default: 0, after: :difficulty
  end
end
