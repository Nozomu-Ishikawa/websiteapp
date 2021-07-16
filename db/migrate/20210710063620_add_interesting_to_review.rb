class AddInterestingToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :interesting, :integer, default: 0, after: :game_title
  end
end
