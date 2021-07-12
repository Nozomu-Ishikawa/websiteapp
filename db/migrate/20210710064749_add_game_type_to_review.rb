class AddGameTypeToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :game_type, :string, after: :game_title
  end
end
