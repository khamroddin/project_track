class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :client_id
      t.date :start_date
      t.date :end_date
      t.integer :manager_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
