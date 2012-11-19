class AddColumDependence < ActiveRecord::Migration
  def change
     remove_column :users, :dependence
    add_column :users, :dependence_id, :integer
  end
end
