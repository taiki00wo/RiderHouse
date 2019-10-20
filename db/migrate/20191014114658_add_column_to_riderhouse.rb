class AddColumnToRiderhouse < ActiveRecord::Migration[6.0]
  def up
    add_column :riderhouses, :latitude, :float
    add_column :riderhouses, :longitude, :float
  end

  def down
    remove_column :riderhouses, :latitude, :float
    remove_column :riderhouses, :longitude, :float
  end
end
