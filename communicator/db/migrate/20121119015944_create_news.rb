class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.boolean :student
      t.boolean :teacher
      t.boolean :admin
      t.date :validity

      t.timestamps
    end
  end
end
