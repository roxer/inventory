class AddColumnsToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :sku, :string
    add_column :products, :cost, :decimal
    add_column :products, :lead_time, :integer
    add_column :products, :categories, :string, array: true, default: []
    add_reference :products, :supplier, null: true, foreign_key: true
  end
end
