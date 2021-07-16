class AddDiffiycultyToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :difficulty, :integer, default: 0, after: :interesting
  end
end
