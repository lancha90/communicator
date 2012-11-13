class CreateDependences < ActiveRecord::Migration
  def change
    create_table :dependences do |t|
      t.string :name
      t.text :mision
      t.text :vision
      t.text :information

      t.timestamps
    end
  end
end
