class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :location
      t.string :website
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
