class CreateSalesHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :sales_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: true, foreign_key: true
      t.decimal :quantity
      t.decimal :sales_price
      t.integer :discount
      t.string :payment_id
      t.datetime :checkout_at
      t.datetime :payment_at
      t.datetime :delivery_at
      t.string :delivery_id

      t.timestamps
    end
  end
end
