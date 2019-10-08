class RemoveColumnUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :interger, :string
  end

  def down 
    add_column :users, :interger, :string
  end
end
