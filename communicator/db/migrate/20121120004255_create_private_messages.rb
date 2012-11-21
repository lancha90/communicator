class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :to_id
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
