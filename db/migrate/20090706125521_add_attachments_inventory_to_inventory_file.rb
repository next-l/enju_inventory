class AddAttachmentsInventoryToInventoryFile < ActiveRecord::Migration
  def self.up
    add_column :inventory_files, :inventory_filename, :string
    add_column :inventory_files, :inventory_content_type, :string
    add_column :inventory_files, :inventory_file_size, :integer
    add_column :inventory_files, :inventory_updated_at, :datetime
  end

  def self.down
    remove_column :inventory_files, :inventory_filename
    remove_column :inventory_files, :inventory_content_type
    remove_column :inventory_files, :inventory_file_size
    remove_column :inventory_files, :inventory_updated_at
  end
end
