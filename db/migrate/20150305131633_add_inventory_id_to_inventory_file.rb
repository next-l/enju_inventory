class AddInventoryIdToInventoryFile < ActiveRecord::Migration
  def change
    add_column :inventory_files, :inventory_id, :string
    rename_column :inventory_files, :inventory_file_size, :inventory_size
    add_index :inventory_files, :inventory_id
  end
end
