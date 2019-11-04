class AddProfileToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :bike_name, :string
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :favorite_load, :string
    add_column :users, :when_ride, :string
  end

  def down
    remove_column :users, :bike_name, :string
    remove_column :users, :location, :string
    remove_column :users, :gender, :string
    remove_column :users, :age, :integer
    remove_column :users, :favorite_load, :string
    remove_column :users, :when_ride, :string
  end
end
