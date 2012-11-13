class UpdateMessageType < ActiveRecord::Migration
  def change
    remove_column :messages, :content
    add_column :messages, :content, :text  
  end
end
