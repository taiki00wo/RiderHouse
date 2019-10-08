class CreateRiderhouses < ActiveRecord::Migration[6.0]
  def change
    create_table :riderhouses do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.integer :price
      t.string :opening_hours

      t.timestamps
    end
  end
end
