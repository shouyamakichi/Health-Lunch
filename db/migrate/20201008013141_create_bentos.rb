class CreateBentos < ActiveRecord::Migration[6.0]
  def change
    create_table :bentos do |t|
      t.integer :calo_id,         null: false, foreign_key: true
      t.integer :user_id,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
