class AddAttachmentDataToAgentImportFile < ActiveRecord::Migration[5.1]
  def change
    add_column :agent_import_files, :attachment_data, :jsonb
  end
end
