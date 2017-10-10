class AddPickupLocationToReserve < ActiveRecord::Migration[5.1]
  def change
    add_column :reserves, :pickup_location_id, :integer
    add_index :reserves, :pickup_location_id
  end
end
