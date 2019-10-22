class AddColumnToRiderhouses < ActiveRecord::Migration[6.0]
  def up
    add_column :riderhouses, :user_id, :integer
  end

  def down
    remove_column :riderhouses, :user_id, :integer
  end
end
