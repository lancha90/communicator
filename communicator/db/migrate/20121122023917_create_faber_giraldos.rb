class CreateFaberGiraldos < ActiveRecord::Migration
  def change
    create_table :faber_giraldos do |t|
      t.string :nombre
      t.integer :edad

      t.timestamps
    end
  end
end
