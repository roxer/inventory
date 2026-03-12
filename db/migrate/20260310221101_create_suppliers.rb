class CreateSuppliers < ActiveRecord::Migration[8.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.references :vendor, null: true, foreign_key: true

      t.timestamps
    end
  end
end
