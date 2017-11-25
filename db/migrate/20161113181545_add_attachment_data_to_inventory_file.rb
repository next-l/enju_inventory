class AddAttachmentDataToInventoryFile < ActiveRecord::Migration[5.1]
  def change
    add_column :inventory_files, :attachment_data, :jsonb
  end
end
