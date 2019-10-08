class AddColumnAgeUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :age, :integer
  end

  def down
    remove_column :users, :age, :integer
  end
end
