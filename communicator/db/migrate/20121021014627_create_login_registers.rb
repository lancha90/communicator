class CreateLoginRegisters < ActiveRecord::Migration
  def change
    create_table :login_registers do |t|
      
      t.timestamps
    end
  end
end
