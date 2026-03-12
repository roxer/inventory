class CreateWarehouses < ActiveRecord::Migration[8.1]
  def change
    create_table :warehouses do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :address
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
