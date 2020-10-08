class CreateCalos < ActiveRecord::Migration[6.0]
  def change
    create_table :calos do |t|
      t.string :name,     null: false
      t.integer :price,     null: false
      t.string :energy,     null: false
      t.string :prote,     null: false
      t.string :salt,     null: false
      t.string :Lipid,     null: false
      t.string :carbo,     null: false
      t.string :first,     null: false
      t.string :second,     null: false
      t.string :third,     null: false
      t.string :forth,     null: false
      t.string :fifth,     null: false
      t.integer :user_id,           null:false, foreign_key: 
      t.timestamps
    end
  end
end
