class AddUserEncodingToEventImportFile < ActiveRecord::Migration[5.2]
  def change
    add_column :event_import_files, :user_encoding, :string
  end
end
