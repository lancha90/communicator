class AddColumnNews < ActiveRecord::Migration
  def change
    add_column :news, :dependence_id, :integer
  end
end
