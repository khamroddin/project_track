class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.integer :organization_id
      t.integer :location_id
      t.boolean :status
      t.timestamps null: false
    end
  end
end
