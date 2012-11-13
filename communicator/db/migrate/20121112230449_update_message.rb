class UpdateMessage < ActiveRecord::Migration
  def change
    remove_column :messages, :user
    add_column :messages, :redactor, :string
  end
end
