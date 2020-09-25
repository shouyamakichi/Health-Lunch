class AddColumnsToProteins < ActiveRecord::Migration[6.0]
  def change
    add_column :proteins, :first, :string,           null: false
    add_column :proteins, :second, :string,           null: false
    add_column :proteins, :third, :string,           null: false
    add_column :proteins, :forth, :string,           null: false
    add_column :proteins, :fifth, :string,           null: false
  end
end