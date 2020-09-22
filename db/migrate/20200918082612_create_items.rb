class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                     null:false
      t.integer :price,                   null:false
      t.text :acount,                     null:false
      t.integer :user_id                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
