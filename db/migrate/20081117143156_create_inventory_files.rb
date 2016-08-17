class CreateInventoryFiles < ActiveRecord::Migration
  def self.up
    create_table :inventory_files do |t|
      t.string :filename
      t.string :content_type
      t.integer :size
      t.references :user, index: true
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :inventory_files
  end
end
