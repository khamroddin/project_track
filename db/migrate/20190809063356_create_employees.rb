class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_no
      t.string :first_name
      t.string :last_name
      t.date :joined_date
      t.string :email
      t.string :mobile
      t.integer :employee_category_id
      t.integer :employee_position_id
      t.integer :organization_id
      t.boolean :status
      t.timestamps null: false
    end
  end
end
