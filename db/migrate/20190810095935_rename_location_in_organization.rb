class RenameLocationInOrganization < ActiveRecord::Migration
  def change
    rename_column :organizations, :location, :location_id
  end
end
