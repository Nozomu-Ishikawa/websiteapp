class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title,        null: false
      t.string :category,     null: false
      t.string :description,  null: false
      t.references :user,     foreign_key: true

      t.timestamps
    end
  end
end
