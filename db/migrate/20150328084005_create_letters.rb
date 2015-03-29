class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :title
      t.string :topic
      t.text :content

      t.timestamps null: false
    end
  end
end
