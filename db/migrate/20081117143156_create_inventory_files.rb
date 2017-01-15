class CreateInventoryFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_files do |t|
      t.string :filename
      t.string :content_type
      t.integer :size
      t.references :user, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
