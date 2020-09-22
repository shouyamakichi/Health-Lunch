class AddColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :energy, :string,      null: false
    add_column :items, :prote, :string,       null: false
    add_column :items, :salt, :string,        null: false
    add_column :items, :Lipid, :string,       null: false
    add_column :items, :carbo, :string,       null: false
  end
end
 