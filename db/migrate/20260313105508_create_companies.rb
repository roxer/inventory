class CreateCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :companies do |t|
      t.string :industry
      t.string :location
      t.string :subscription_tier
      t.integer :size

      t.timestamps
    end
  end
end
