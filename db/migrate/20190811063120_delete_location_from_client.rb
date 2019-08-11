class DeleteLocationFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :location_id
  end
end
