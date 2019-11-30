class ChangeColumnToMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :room_id, :string
    add_column :messages, :room_id, :integer
  end
end
