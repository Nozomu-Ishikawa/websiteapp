class AddGameToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :game, foreign_key: true, after: :user_id
  end
end
