class AddUserIdToLoginRegister < ActiveRecord::Migration
  def change
    add_column :login_registers, :user_id, :integer
    
  end
end
