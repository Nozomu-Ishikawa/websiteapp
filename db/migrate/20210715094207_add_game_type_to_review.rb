class AddGameTypeToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :gametype, :integer, default: 0, after: :interesting
  end
end
