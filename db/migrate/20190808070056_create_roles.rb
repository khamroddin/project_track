class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|

      t.string :name,  null: false, default: ""
      t.boolean :status

      t.timestamps null: false
    end
  end
end
