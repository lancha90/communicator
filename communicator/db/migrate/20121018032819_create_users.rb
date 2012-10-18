class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firtname
      t.string :secondname
      t.string :code
      t.string :email
      t.string :dependence
      t.string :rol

      t.timestamps
    end
  end
end
