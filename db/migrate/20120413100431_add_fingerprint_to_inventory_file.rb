class AddFingerprintToInventoryFile < ActiveRecord::Migration[5.2]
  def change
    add_column :inventory_files, :inventory_fingerprint, :string
  end
end
