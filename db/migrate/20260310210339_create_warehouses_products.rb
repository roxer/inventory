class CreateWarehousesProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :warehouses_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
