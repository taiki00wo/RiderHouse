class DropTableUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :users
  end
end
