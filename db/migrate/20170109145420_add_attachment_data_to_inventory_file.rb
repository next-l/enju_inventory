class AddAttachmentDataToInventoryFile < ActiveRecord::Migration[5.0]
  def change
    add_column :inventory_files, :attachment_data, :jsonb
  end
end