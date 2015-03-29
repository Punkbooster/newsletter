class CreateClientsLetters < ActiveRecord::Migration
  def change
    create_table :clients_letters do |t|
      t.belongs_to :client, index: true
      t.belongs_to :letter, index: true
    end
  end
end
