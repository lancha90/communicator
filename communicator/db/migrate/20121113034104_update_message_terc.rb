class UpdateMessageTerc < ActiveRecord::Migration
  def change
  add_column :messages, :dependence, :integer
  end
end
