class CreateEmployeeLogs < ActiveRecord::Migration
  def change
    create_table :employee_logs do |t|
      t.integer :employee_id
      t.integer :task_id
      t.date :log_date
      t.time :start_time
      t.time :end_time
      t.float :total_hours

      t.timestamps null: false
    end
  end
end