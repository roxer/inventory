class CreateUsersIntegrations < ActiveRecord::Migration[8.1]
  def change
    create_table :users_integrations do |t|
      t.references :integration, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
