class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :game_brand,   default: 0
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
