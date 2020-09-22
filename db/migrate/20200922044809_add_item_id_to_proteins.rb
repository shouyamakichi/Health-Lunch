class AddItemIdToProteins < ActiveRecord::Migration[6.0]
  def change
    add_column :proteins, :item_id, :integer,        null: false,  foreign_key: true 
  end
end
