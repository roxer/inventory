class CreateOnboardingStates < ActiveRecord::Migration[8.1]
  def change
    create_table :onboarding_states do |t|
      t.references :onboarding, null: false, foreign_key: true
      t.string :step, null: false
      t.string :status, null: false # :in_proggress, :completed
      t.integer :progress, null: true

      t.timestamps
    end
  end
end
