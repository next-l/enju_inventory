class AddAttachmentDataToUserExportFile < ActiveRecord::Migration[5.1]
  def change
    add_column :user_export_files, :attachment_data, :jsonb
  end
end
