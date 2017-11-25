class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.references :item, foreign_key: true, type: :uuid
      t.references :inventory_file, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
