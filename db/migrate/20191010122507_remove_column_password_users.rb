class RemoveColumnPasswordUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :password, :string
  end

  def down
    add_column :users, :password, :string
  end
end
