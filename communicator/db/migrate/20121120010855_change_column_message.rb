class ChangeColumnMessage < ActiveRecord::Migration
  def change
    remove_column :private_messages, :dependence_id
    add_column :private_messages, :user, :integer
  end
end
