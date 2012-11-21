class ChangeColumnMessageUser < ActiveRecord::Migration
  def change
    remove_column :private_messages, :user
    add_column :private_messages, :user_id, :integer
  end
end
