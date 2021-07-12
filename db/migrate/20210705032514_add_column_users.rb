class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :string, after: :name
    add_column :users, :image, :string, after: :profile
  end
end
