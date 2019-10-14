class AddColumnToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :name, :string
    add_column :users, :image, :string
  end

  def down
    remove_column :users, :name, :string
    remove_column :users, :image, :string
  end
end
