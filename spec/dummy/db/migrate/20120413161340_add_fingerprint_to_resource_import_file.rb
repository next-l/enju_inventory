class AddFingerprintToResourceImportFile < ActiveRecord::Migration[5.2]
  def change
    add_column :resource_import_files, :resource_import_fingerprint, :string
  end
end
