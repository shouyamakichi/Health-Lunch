class AddUserIdToProteins < ActiveRecord::Migration[6.0]
  def change
    add_column :proteins, :user_id, :integer,   null: false, foreign_key: true 
  end
end
