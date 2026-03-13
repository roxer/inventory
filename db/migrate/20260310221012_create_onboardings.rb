class CreateOnboardings < ActiveRecord::Migration[8.1]
  def change
    create_table :onboardings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :current_step, null: false, default: 'step_1'
      t.integer :default_lead_time
      t.integer :default_days_of_stock
      t.integer :default_forecasting_days
      t.string :existing_pos
      t.boolean :vendors_as_suppliers
      t.string :bundles
      t.string :requested_integrations, array: true, default: []
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
