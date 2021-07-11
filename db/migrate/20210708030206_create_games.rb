class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title,        null: false
      t.string :game_brand,   default: 0
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
