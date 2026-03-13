class AddColumnsToWarehouses < ActiveRecord::Migration[8.1]
  def change
    add_column :warehouses, :type, :string
    add_column :warehouses, :capacity, :integer
  end
end
