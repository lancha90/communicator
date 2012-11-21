class ChangeColumn < ActiveRecord::Migration
  def change
    remove_column :private_messages, :to_id
    add_column :private_messages, :dependence_id, :integer
  end
end
