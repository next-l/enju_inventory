class CreateInventoryFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_files do |t|
      t.references :user
      t.text :note

      t.timestamps
    end
  end
end
