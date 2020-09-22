class CreateProteins < ActiveRecord::Migration[6.0]
  def change
    create_table :proteins do |t|
      t.string :name,     null: false
      t.string :acount,     null: false
      t.integer :price,     null: false
      t.string :energy,     null: false
      t.string :prote,     null: false
      t.string :salt,     null: false
      t.string :Lipid,     null: false
      t.string :carbo,     null: false
      t.timestamps
    end
  end
end
