class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :title
      t.date :opening
      t.date :close
      t.text :profile
      t.text :work
      t.integer :hours_week
      t.integer :hours_total

      t.timestamps
    end
  end
end
