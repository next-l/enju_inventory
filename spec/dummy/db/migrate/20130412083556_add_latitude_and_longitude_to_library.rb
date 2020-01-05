class AddLatitudeAndLongitudeToLibrary < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :latitude, :float
    add_column :libraries, :longitude, :float
  end
end
