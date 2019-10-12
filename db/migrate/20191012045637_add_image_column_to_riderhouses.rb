class AddImageColumnToRiderhouses < ActiveRecord::Migration[6.0]
  def up
    add_column :riderhouses, :image, :string
  end

  def down
    remove_column :riderhouses, :image, :string
  end
end
