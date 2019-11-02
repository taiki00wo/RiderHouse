class RemoveColumnAgeUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :age, :string
  end

  def down
    add_column :users, :age, :string
  end
end
