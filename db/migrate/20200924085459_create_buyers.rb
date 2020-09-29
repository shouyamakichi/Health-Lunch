class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.integer :protein_id,         null: false, foreign_key: true
      t.integer :user_id,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
