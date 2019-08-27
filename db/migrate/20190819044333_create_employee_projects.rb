class CreateEmployeeProjects < ActiveRecord::Migration
  def change
    create_table :employee_projects do |t|
      t.integer :project_id
      t.integer :employee_id
      t.boolean :status
      t.timestamps null: false
    end
  end
end
