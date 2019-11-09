class AddColumnTwwiterIdToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :twitter_id, :string
  end

  def down
    remove_column :users, :twitter_id, :string
  end
end
