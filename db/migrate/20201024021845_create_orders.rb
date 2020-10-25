class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :cart_id,     null: false,    foreign_key: true
      t.integer :total_price,  null: false
      t.timestamps
    end
  end
end
