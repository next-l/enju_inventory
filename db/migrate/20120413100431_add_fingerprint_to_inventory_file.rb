class AddFingerprintToInventoryFile < ActiveRecord::Migration
  def change
    add_column :inventory_files, :fingerprint, :string
  end
end
