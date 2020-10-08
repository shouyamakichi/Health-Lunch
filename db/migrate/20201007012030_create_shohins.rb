class CreateShohins < ActiveRecord::Migration[6.0]
  def change
    create_table :shohins do |t|
      t.integer :soft_id,         null: false, foreign_key: true
      t.integer :user_id,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
