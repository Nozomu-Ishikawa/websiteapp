class AddColumnReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :game_title, :string, after: :title
  end
end
