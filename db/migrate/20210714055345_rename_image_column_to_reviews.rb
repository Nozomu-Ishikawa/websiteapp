class RenameImageColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :image, :images
  end
end
