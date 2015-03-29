class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :imie
      t.string :nazwisko

      t.timestamps null: false
    end
  end
end
