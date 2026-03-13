class AddColumnsToVendors < ActiveRecord::Migration[8.1]
  def change
    add_column :vendors, :country, :string
    add_column :vendors, :avg_lead_time, :integer
    add_column :vendors, :reliability_score, :numeric
  end
end
