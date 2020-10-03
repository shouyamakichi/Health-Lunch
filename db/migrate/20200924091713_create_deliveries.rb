class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :buyer_id,        null: false, foreign_key: true
      t.string  :pref01
      t.string :addr01
      t.string :zip01,              null: false
      t.string :reference,        null: false
      t.string :building
      t.string :phone_number,     null: false

      t.timestamps
    end
  end
end
