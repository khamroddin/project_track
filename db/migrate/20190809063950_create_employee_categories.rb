class CreateEmployeeCategories < ActiveRecord::Migration
  def change
    create_table :employee_categories do |t|
      t.string :name
      t.boolean :status
      t.timestamps null: false
    end
  end
end
