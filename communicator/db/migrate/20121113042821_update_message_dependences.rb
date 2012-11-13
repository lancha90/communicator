class UpdateMessageDependences < ActiveRecord::Migration
  def change
    remove_column :messages, :dependence
    add_column :messages, :dependence_id, :integer
  end
end
