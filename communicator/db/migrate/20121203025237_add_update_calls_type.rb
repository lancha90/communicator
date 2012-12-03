class AddUpdateCallsType < ActiveRecord::Migration
  def change
    remove_column :calls, :type
    add_column :calls, :sort, :integer
  end
end
